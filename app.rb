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

# get('/employee/:id') do
#   @employee = Employee.find(params.fetch("client_id").to_i())
#   @divisions = Division.all()
#   erb(:employee)
# end

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
