class @ContactRowView extends Backbone.View
  template: JST['backbone/templates/contact_row']
  tagName: 'tr'
  attributes: { class: 'contact-row' }

  events:
    'click .destroy-btn': 'destroy'

  initialize: (args)->
    @contact = args.contact

  render: ->
    @$el.html(@template(@context()))

  destroy: ->
    if confirm('Bạn có chắc không?')
      @contact.destroy
        success: (response)=>
          @remove()
        error: (response)->
          alert(response.responseJSON.error)

  context: ->
    {
      name: @contact.get('name')
      telephone: @contact.get('telephone')
      address: @contact.get('address')
      id: @contact.get('id')
    }
