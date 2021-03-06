#JQuery and Ajax - Deaf Grandma Tutorial
####Phase 3 Research
Team: Jimmy, Dan, Luisa, Chae

##Getting Started
-  Building from Rails-The-Sinatra-Way by Keith Tom, we are going to start from a Deaf Grandma application that has been formatted to use partials and a page resource.


##Setup

- using Rails 3.2.11
- in Gemfile : make sure that gem 'jquery-rails' is included (it should already by included when you create a new rails app)
- in application.js (i.e. "the manifest file") : automatically generated asset pipeline (looks like it's commented out but it's running). 
         
   - Note that 'require_tree' loads all js files included in the directory
- in index.html.erb: include links and script tag to load JS

##Creating a link

- (in index.html.erb)
- 'link_to' creates an '< a href >' tag. This link will show the `new.html.erb` view. Run `rake routes` for more information. 
- add 'remote: true': this tells Rails that we want to prevent the default and that we'll have an ajax event
- create file 'new.js.erb' and add the following code:

        $('#show_form').html('<%= escape_javascript(render :partial => "form") %>')
        

##Creating the Form

- (in form.html.erb)
- include 'remote: true' in the parameters
- we use 'form_tag' in cases when we're not manipulating our models. If we were, we would use 'form_for' and pass in an instance variable. 
- create file `show.js.erb` and add the following code:

        $('#grandma_form').bind('ajax:success', function(){
          $('#show_response').html('<%= j (render :partial => "response") %>')
        })

- we're calling .bind() on our form with id #grandma_form. When the ajax call is successful, we'll replace our div '#show_response' with our response partial. 
        - note that 'j' and 'escape_javascript' are aliases. Both methods let us escape JS.
  

##More Notes on Forms

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
