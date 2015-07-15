module API
  module V1
    class Contacts < Grape::API
      prefix :v1
      format :json

      resources :contacts do
        desc 'Create contact'
        params do
          requires :name, type: String
          requires :telephone, type: String
          optional :address, type: String
        end
        post do
          contact = Contact.create(params)
          if contact.valid?
            contact
          else
            error!(contact.errors.full_messages.join('. '), 400)
          end
        end

        desc 'Get contact lists'
        get do
          Contact.all
        end
      end
    end
  end
end
