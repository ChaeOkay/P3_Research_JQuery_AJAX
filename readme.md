#JQuery and Ajax - Deaf Grandma Tutorial
####Phase 3 Research
Team: Jimmy, Dan, Luisa, Chae

##Out of the Box
When creating a `rails new` application:
-  `jquery-rails` gem will automatically be provided in the gemfile.
-  `app_root/app/assets/javascripts/application.js` will automatically require jquery and jquery-ujs (unobtrusive javascript) functionality.

##Getting Started
-  Building from Rails-The-Sinatra-Way by Keith Tom, we are going to start from a Deaf Grandma application that has been formatted to use partials and a page resource.

##Terminology

-  Unobstrusive JS: Instead of writing inline JS, the Rails convention is to separate concerns and separate JS out from HTML. 

##Processing the Server Response

The respond_to block in the controller lets us route Ajax requests for different data types. In the following (shortened) example from the [Ruby Guides](http://guides.rubyonrails.org/working_with_javascript_in_rails.html),
an index page's bottom portion provides a form for creating a new user. The form uses Ajax to call the 'create' action on the Users controller. This requires us to set the form's remote option to 'true' in the index view (app/views/users/index.html.erb). 

        <%= form_for (@user, remote: true) do |f| %>
           <%= f.label :name %><br>
           <%= f.text_field :name %>
           <%  f.submit %>
        <% end %>


The respond_to block in the 'create' method (in app/controllers/user_controller.rb) could look something like:


        def create

         @user = User.new(params[:user])

           respond_to do |format|
                format.html { redirect_to @user }
                format.js   {}
           end
        end


Note that only one of the lines 38 or 39 is executed, depending on the request. If the request is Ajax, 
Rails calls a '.js.erb' file with the same name as the action, (i.e., create.js.erb). A '.js.erb' file allow us to mix JS and 
erb in order to perform actions on the current page. In this example, the file in app/views/users/create.js.erb contains the following:

        $("<%= escape_javascript(render @user) %>").appendTo("#users");

(As a side note, you may be wondering about what 'escape_javascript' is doing. It's actually a view helper method that ensures that the string returned will not "break" the JS with
quotes or other characters that don't jibe with JS syntax.) 



##Links
-  On the Index view, added remote to link
-  Created new.js.erb with javascript functions

##Forms

form_for is a helper that assists with writing forms. form_for takes a :remote option. It works like this:

        <%= form_for(@post, remote: true) do |f| %>
          ...
        <% end %>

This will generate the following HTML:

        <form accept-charset="UTF-8" action="/posts" class="new_post" data-remote="true" id="new_post" method="post">
          ...
        </form>
        
Note the data-remote='true'. Now, the form will be submitted by Ajax rather than by the browser's normal submit mechanism.

You probably don't want to just sit there with a filled out <form>, though. You probably want to do something upon a successful submission. To do that, bind to the ajax:success event. On failure, use ajax:error. Check it out:

        $(document).ready ->
          $("#new_post").on("ajax:success", (e, data, status, xhr) ->
            $("#new_post").append xhr.responseText
          ).bind "ajax:error", (e, xhr, status, error) ->
            $("#new_post").append "<p>ERROR</p>"


##Resources
-  [DaringFireball Markdown](http://daringfireball.net/projects/markdown/syntax#link)
-  [RailsCasts #136](http://railscasts.com/episodes/136-jquery-ajax-revised)
-  [Phase 3 Research from dontmitch](https://github.com/dontmitch/intro_to_rails/blob/master/Guides/7_jquery_and_ajax.md)
-  [JQuery-ujs](https://github.com/rails/jquery-ujs/wiki/ajax)
-  [Remote Links and Forms](http://www.alfajango.com/blog/rails-3-remote-links-and-forms/)
