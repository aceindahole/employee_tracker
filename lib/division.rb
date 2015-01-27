class Division < ActiveRecord::Base
  define_method(:add_employee) do |employee|
    employee.update(division_id: id)
  end

  define_method(:list_employees) do
    Employee.where(division_id: id)
  end
end
