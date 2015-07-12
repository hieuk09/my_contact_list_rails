module API
  module V1
    class Root < Grape::API
      rescue_from ActiveRecord::RecordNotFound do
        error_response({ message: "Record Not Found", status: 404})
      end

      error_formatter :json, API::V1::ErrorFormatter
    end
  end
end
