class @ContactNewView extends Backbone.View
  template: JST['backbone/templates/contact_new']
  tagName: 'tr'
  attributes: { class: 'contact-row' }

  events:
    'click .save-btn': 'save'
    'click .back-btn': 'destroy'

  initialize: ->
    @contact = new Contact()

  render: ->
    @$el.html(@template())

  save: ->
    @contact.save {
      name: @getContent('.name')
      address: @getContent('.address')
      telephone: @getContent('.telephone')
    },
      error: (model, response)->
        alert(response.responseJSON.error)
      success: (model, response)=>
        @$el.trigger('contactCreated', model)

  destroy: ->
    @remove()

  getContent: (field)->
    $(@el).find(field).val()
