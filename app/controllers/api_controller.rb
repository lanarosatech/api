require 'jwt'

class ApiController < ApplicationController
  before_action :authenticate
  skip_before_action :verify_authenticity_token

  def calculate_bmi
    height = params['height'].to_f
    weight = params['weight'].to_f

    # Calcula o IMC
    bmi = (weight / (height**2)).round(1)

    # Determina a qualificação do imc e o nível da obesidade
    classification = determine_classification(bmi)
    obesity = determine_obesity(bmi)

    # Retorna o IMC (classificação e nível)
    render json: { imc: bmi, classification: classification, obesity: obesity }
  end

  private

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

  def authenticate
    if request.headers["Authorization"].present?
      token = request.headers["Authorization"].split(" ").last
      begin
        JWT.decode(token,  ENV['JWT_SECRET_KEY'])
      rescue JWT::DecodeError
        render json: { error: "Invalid token" }, status: :unauthorized
      end
    else
      render json: { error: "Token not found" }, status: :unauthorized
    end
  end
end
