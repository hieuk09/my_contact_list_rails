class @ContactIndexView extends Backbone.View
  el: $(".contact.index")

  events:
    'click .new-btn': 'newContact'
    'contactCreated': 'createContact'

  render: ->

  newContact: ->
    @newContactView = new ContactNewView()
    @newContactView.render()
    $(@el).find('.contact-table').prepend(@newContactView.$el)

  createContact: (event, contact)->
    @newContactView.remove()
    view = new ContactRowView({contact: contact})
    view.render()
    $(@el).find('.contact-table').prepend(view.$el)
