Dado('que o usuario consulte informacoes de funcionario') do
    @url = 'https://628670f0f0e8f0bb7c164350.mockapi.io/Usuarios'
    
end
  
Quando('ele realizar a pesquisa') do
    @list_employee = HTTParty.get(@url)
end
  
Entao('uma lista de funcionarios deve retornar') do
    expect(@list_employee.code).to eql 200
    expect(@list_employee.message).to eql 'OK'
end

Dado('que o usuario cadastre um novo funcionario') do
    @url = 'https://628670f0f0e8f0bb7c164350.mockapi.io/Usuarios'
end
  
Quando('ele enviar as informacoes de funcionario') do
    @create_employee = HTTParty.post(@url, :headers => {'Content-Type': 'application/json'}, body: {
        "employee_name": "Vinicin do Gás",
        "employee_salary": 82295,
        'employee_age': 23,
        "id": ""
    }.to_json)

        puts @create_employee
end
  
  Entao('esse funcionario sera cadastrado') do
    puts @create_employee.code
    puts @create_employee.msg
    expect(@create_employee["employee_name"]).to eql 'Vinicin do Gás'
    expect(@create_employee["employee_salary"]).to eql (82295)
    expect(@create_employee["employee_age"]).to eql (23)
    expect(@create_employee.code).to eql 201
    expect(@create_employee.message).to eql 'Created'
  end