class @ContactNewView extends Backbone.View
  template: JST['backbone/templates/contact_new']
  tagName: 'tr'
  attributes: { class: 'contact-row new-contact' }

  events:
    'click .save-btn': 'save'
    'click .back-btn': 'destroy'

  initialize: ->

  render: ->
    @$el.html(@template())

  save: ->
    @contact = new Contact
      name: @getContent('.name')
      address: @getContent('.address')
      telephone: @getContent('.telephone')

    @contact.save {},
      error: (model, response)->
        alert(response.responseJSON.error)
      success: (model, response)=>
        @clearContent()
        @$el.trigger('contactCreated', model)

  destroy: ->
    @remove()

  getContent: (field)->
    $(@el).find(field).val()

  clearContent: ->
    for field in ['.name', '.address', '.telephone']
      $(@el).find(field).val('')
