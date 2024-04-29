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


Dado('que o usuario altere uma informacao de funcionario') do
    @get_employee = HTTParty.get('https://628670f0f0e8f0bb7c164350.mockapi.io/Usuarios', :headers => {'Content-Type': 'application/json'})
    puts @get_employee[0]['id']
    @url_put = 'https://628670f0f0e8f0bb7c164350.mockapi.io/Usuarios/' + @get_employee[0]["id"].to_s
end
  
Quando('ele enviar as novas informacoes') do
    @update_employee = HTTParty.put(@url_put, :headers => {'Content-Type': 'application/json'}, body: {
        "employee_name": "Vinicin do Gás EDITADO",
        "employee_salary": 10,
        'employee_age': 24,
        "id": ""
    }.to_json)

    puts @update_employee

end
  
Entao('as informacao serao alteradas') do
    puts @update_employee.code
    puts @update_employee.msg
    expect(@update_employee["employee_name"]).to eql 'Vinicin do Gás EDITADO'
    expect(@update_employee["employee_salary"]).to eql (10)
    expect(@update_employee["employee_age"]).to eql (24)
    expect(@update_employee.code).to eql 200
    expect(@update_employee.message).to eql 'OK'
end