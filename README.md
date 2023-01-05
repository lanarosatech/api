# Introdução

Esse é um código backend para uma API que calcula o IMC. Ele faz parte de um teste dentro de um processo seletivo. O código foi iniciado do zero, apenas com a informação de input e output desejada.

# Como usar?

Ao inputar o peso e altura (pode ser feito pelo ./spec/requests/api_spec.rb), o código usa uma calculadora para retornar o valor do IMC,  a classificação e o índice do mesmo.

Outra possibilidade de teste é o Postman, a partir do url 'localhost:3000/imc'
Obs: Para esse teste utilizei um token destinado ao exercício.

A partir da implementação do front com um form de input dos dados ou um seed com um banco de dados, será necessário apenas chamar o método "bmi_calculate". E vale ressaltar que essa API está programada para retornar JSON.

# Sobre o funcionamento do jogo dentro do código:

Optei por deixá-lo comentado com as lógicas de programação que usei.

# O que você melhoraria da próxima vez?

Implementar novas features, como:

Um seed com dados dos pacientes, podendo usá-los para gerar o IMC de cada um.

Colocar um alerta de contato para os pacientes com nível de obesidade preocupante. Uma forma de cuidar dos pacientes
e convidá-lo a retornar a clínica/médico para uma avaliação.

Opção de compartilhamento do output pelo admin para o paciente via email/telefone.
