class @ContactRowView extends Backbone.View
  template: JST['backbone/templates/contact_row']
  tagName: 'tr'
  attributes: { class: 'contact-row' }

  events:
    'click .btn-edit': 'edit'
    'click .btn-destroy': 'destroy'

  initialize: (args)->
    @contact = args.contact

  render: ->
    @$el.html(@template(@context()))

  edit: ->

  destroy: ->

  context: ->
    {
      name: @contact.get('name')
      telephone: @contact.get('telephone')
      address: @contact.get('address')
    }
