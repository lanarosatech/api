Rails.application.routes.draw do
  post '/imc', to: 'api#calculate_bmi'
end
