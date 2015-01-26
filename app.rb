require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/employee")
require("./lib/division")
require("pg")


get('/') do
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:index)
end

get('/employee/:id') do
  @employee = Employee.find(params.fetch("id").to_i())
  @divisions = Division.all()
  if @employee.division_id != nil
    @division = Division.find(@employee.division_id)
  else
    @division = nil
  end
  erb(:employee)
end

get('/division/:id') do
  @division = Division.find(params.fetch("id").to_i())
  @employees = Employee.all()
  erb(:division)
end

post('/add_employee') do
  name = params.fetch('name')
  @employee = Employee.create({:name => name})
  redirect '/'
end

post('/add_division') do
  name = params.fetch('name')
  @division = Division.create({:name => name})
  redirect '/'
end

patch '/employee_division' do
  division_id = params.fetch("division_id").to_i
  employee_id = params.fetch("employee_id").to_i
  Division.find(division_id).add_employee(Employee.find(employee_id))
  redirect back
end
