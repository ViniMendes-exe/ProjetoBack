class Employee_Request

    def find_employee
        Employee.get('/Usuarios')
    end

    def create_employee(name, salary, age)
        Employee.post('/Usuarios', body: {
            "employee_name": name,
            "employee_salary": salary,
            "employee_age": age,
            "id": ""
    }.to_json)
    end

    def update_employee(id, name, salary, age)
        Employee.put('/Usuarios/' + id.to_s, body: {
            "employee_name": name,
            "employee_salary": salary,
            "employee_age": age,
            "id": ""
    }.to_json)
    end

    def delete_employee(id)
        Employee.delete('/Usuarios/' + id.to_s)
    end

end