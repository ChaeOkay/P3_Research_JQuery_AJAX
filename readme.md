#JQuery and Ajax - Deaf Grandma Tutorial
####Phase 3 Research
Team: Jimmy, Dan, Luisa, Chae

##Out of the Box
When creating a `rails new` application:
-  `jquery-rails` gem will automatically be provided in the gemfile.
-  `app_root/app/assets/javascripts/application.js` will automatically require jquery and jquery-ujs (unobtrusive javascript) functionality.
  
##Getting Started
-  Building from Rails-The-Sinatra-Way by Keith Tom, we are going to start from a Deaf Grandma application that has been formatted to use partials.  
-  *****Explain the route and pages_controller

##Forms
-  Modify the `_form.html.erb` partial using the rails rails `form_tag`

                <%= form_tag("/grandma", method: "post") do %>
                  Say something to Grandma:</br>
                  <%= text_field_tag :user_input %>
                  <%= submit_tag("Send Message") %>
                <% end %>

##Resources
-  [DaringFireball Markdown](http://daringfireball.net/projects/markdown/syntax#link)
-  [RailsCasts #136](http://railscasts.com/episodes/136-jquery-ajax-revised)
-  [Phase 3 Research from dontmitch](https://github.com/dontmitch/intro_to_rails/blob/master/Guides/7_jquery_and_ajax.md)
-  [JQuery-ujs](https://github.com/rails/jquery-ujs/wiki/ajax)
-  [Remote Links and Forms](http://www.alfajango.com/blog/rails-3-remote-links-and-forms/)
