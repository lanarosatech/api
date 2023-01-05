class ApiController < ApplicationController
  before_action :authenticate_request

  def calculate_bmi
    # Parse para o form data // No momento os dados estão no teste que está no spec
    form_data = Rack::Utils.parse_nested_query(request.raw_post)
    height = form_data['height'].to_f
    weight = form_data['weight'].to_f

    # Calcula o IMC
    bmi = (weight / (height ** 2)).round(1)

    # Determina a qualificação do imc e o nível da obesidade
    classification = determine_classification(bmi)
    obesity = determine_obesity(bmi)

    # Retorna o IMC (classificação e nível)
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
