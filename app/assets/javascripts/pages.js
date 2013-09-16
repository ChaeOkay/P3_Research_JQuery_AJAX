$('#show_form').html('<%= escape_javascript(render :partial => "form") %>')

$('#grandma_form').bind('ajax:success', function(){
  $('#show_response').html('<%= j (render :partial => "response") %>')
})
