Dado('que o usuario consulte informacoes de funcionario') do
    @getlist = Employee_Request.new
end
  
Quando('ele realizar a pesquisa') do
    @list_employee = @getlist.find_employee
end
  
Entao('uma lista de funcionarios deve retornar') do
    expect(@list_employee.code).to eql 200
    expect(@list_employee.message).to eql 'OK'
end

Dado('que o usuario cadastre um novo funcionario') do
    @create = Employee_Request.new
    @name = Faker::Name.name
    @salary = Faker::Number.number
    @age = Faker::Number.number(digits: 2)
end
  
Quando('ele enviar as informacoes de funcionario') do
    @create_employee = @create.create_employee(@name, @salary, @age)  
end
  
Entao('esse funcionario sera cadastrado') do
    expect(@create_employee["employee_name"]).to eql @name
    expect(@create_employee["employee_salary"]).to eql @salary
    expect(@create_employee["employee_age"]).to eql @age
    expect(@create_employee.code).to eql 201
    expect(@create_employee.message).to eql 'Created'
end

Dado('que o usuario altere uma informacao de funcionario') do
    @request = Employee_Request.new
end
  
Quando('ele enviar as novas informacoes') do
   @update_employee = @request.update_employee(@request.find_employee[0]["id"], @name, @salary, @age)
end
  
Entao('as informacao serao alteradas') do
    expect(@update_employee["employee_name"]).to eql @name
    expect(@update_employee["employee_salary"]).to eql @salary
    expect(@update_employee["employee_age"]).to eql @age
    expect(@update_employee.code).to eql 200
    expect(@update_employee.message).to eql 'OK'
end

Dado('que o usuario queira deletar um funcionario') do
   @request = Employee_Request.new
end
  
Quando('ele enviar a identificacao unica') do
    @delete_employee = @request.delete_employee(@request.find_employee[0]["id"])
end
  
Entao('esse funcionario sera deletado') do
    expect(@delete_employee.code).to eql 200
    expect(@delete_employee.message).to eql 'OK'
end
