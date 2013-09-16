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

- the respond_to method in the controller allows you to route an Ajax request for different data types. In the following (shortened) example from the Ruby Guides, the top portion
of an index page displays a list of users, while the bottom portion provides a form to create a new user. The form calls the 'create' action on the Users controller. 
This Ajax call requires the form's remote option to be set to 'true' in the index view (app/views/users/index.html.erb). The view might look something like this:


     <%= form_for(@user, remote: true) do |f| %>
      <%= f.label :name %><br>
      <%= f.text_field :name %>
      <%  f.submit %>
     <% end %>


The respond_to method in app/controllers/user_controller.rb could then look something like:



def create

  @user = User.new(params[:user])

  respond_to do |format|
    if @user.save
      format.html { redirect_to @user, notice: 'User was successfully created.' }
      format.js   {}
    else
      format.html { render action: "new" }
    end
  end
end

,,,

Notice like 38: the format.js allows the controller to respond to Ajax. The actual JS code that is sent to the client side
is generated by the corresponding app/views/users/create.js.erb view file. That code will look something like:

,,,

$("<%= escape_javascript(render @user) %>").appendTo("#users");


'''

##Links
-  On the Index view, added remote to link
-  Created new.js.erb with javascript functions

##Forms


##Resources
-  [DaringFireball Markdown](http://daringfireball.net/projects/markdown/syntax#link)
-  [RailsCasts #136](http://railscasts.com/episodes/136-jquery-ajax-revised)
-  [Phase 3 Research from dontmitch](https://github.com/dontmitch/intro_to_rails/blob/master/Guides/7_jquery_and_ajax.md)
-  [JQuery-ujs](https://github.com/rails/jquery-ujs/wiki/ajax)
-  [Remote Links and Forms](http://www.alfajango.com/blog/rails-3-remote-links-and-forms/)
