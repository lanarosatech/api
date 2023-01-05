class ApiController < ApplicationController
  before_action :authenticate_request

  def calculate_bmi
    # Parse the form data and extract the height and weight
    form_data = Rack::Utils.parse_nested_query(request.raw_post)
    height = form_data['height'].to_f
    weight = form_data['weight'].to_f

    # Calculate the BMI
    bmi = (weight / (height ** 2)).round(1)

    # Determine the classification and obesity level
    classification = determine_classification(bmi)
    obesity = determine_obesity(bmi)

    # Return BMI, classification, and obesity level in response body
    render json: { imc: bmi, classification: classification, obesity: obesity }
  end

  def determine_classification(bmi)
    if bmi < 18.5
      'Abaixo do peso'
    elsif bmi < 25
      'Normal'
    elsif bmi < 30
      'Sobrepeso'
    else
      'Obeso'
    end
  end

  def determine_obesity(bmi)
    if bmi < 35
      'I'
    elsif bmi < 40
      'II'
    else
      'III'
    end
  end

  private

  def authenticate_request
    # Decode and verify JWT token in request header
    # If the token is valid, set @current_user to the decoded user payload
    # If the token is invalid, raise an exception
  end
end
