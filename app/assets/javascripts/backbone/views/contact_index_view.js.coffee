class @ContactIndexView extends Backbone.View
  el: $(".contact.index")

  events:
    'click .new-btn': 'newContact'
    'contactCreated': 'createContact'

  render: ->

  newContact: ->
    unless @hasNewContactView()
      view = new ContactNewView()
      view.render()
      $(@el).find('.contact-table').prepend(view.$el)

  createContact: (event, contact)->
    view = new ContactRowView({contact: contact})
    view.render()
    $(@el).find('.contact-table .new-contact').after(view.$el)

  hasNewContactView: ->
    $(@el).find('.contact-table .new-contact').length != 0
