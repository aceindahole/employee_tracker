require("spec_helper")

describe(Employee) do

  describe(".create") do
    it("adds a new instance of the Employee class and immediately saves it to the database") do
      employee1 = Employee.create({:name => "Clem-Clem"})
      employee2 = Employee.create({:name => "Ty-Ty"})
      best_employees = [employee1, employee2]
      expect(Employee.all()).to(eq(best_employees))
    end
  end

end
