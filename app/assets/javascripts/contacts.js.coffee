# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#= require lib/underscore-min
#= require lib/backbone-min
#= require lib/handlebars-v3.0.3
#= require backbone/models/contact
#= require backbone/collections/contact_list
#= require backbone/templates/contact_new
#= require backbone/templates/contact_row
#= require backbone/views/contact_new_view
#= require backbone/views/contact_row_view
#= require backbone/views/contact_index_view

view = new ContactIndexView()
view.render()
