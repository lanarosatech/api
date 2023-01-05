require 'rails_helper'

RSpec.describe 'IMC API', type: :request do
  describe 'POST /imc' do
    it 'calculates the BMI and returns the classification and obesity level' do
      # Generate a JWT token
      secret_key = ENV['JWT_SECRET_KEY']
      token = JWT.encode({ user_id: 1 }, secret_key)

      # Set the Authorization header with the JWT token
      headers = { 'Authorization': "Bearer #{token}" }

      # Send a POST request to the /imc endpoint with the height and weight
      post '/imc', params: { height: 1.70, weight: 76 }, headers: headers

      # Expect the response status code to be 200
      expect(response).to have_http_status(200)

      # Parse the JSON response body
      json_response = JSON.parse(response.body)

      # Expect the response to have the correct BMI value
      expect(json_response['imc']).to be_within(0.01).of(26.3)

      # Expect the response to have the correct classification
      expect(json_response['classification']).to eq('Sobrepeso')

      # Expect the response to have the correct obesity level
      expect(json_response['obesity']).to eq('I')
    end
  end
end
