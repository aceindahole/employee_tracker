require("spec_helper")

describe(Division) do

  describe(".create") do
    it("adds a new instance of the Division class and immediately saves it to the database") do
      division1 = Division.create({:name => "Candy Taste Testing"})
      division2 = Division.create({:name => "Legal Attack Team"})
      worst_divisions = [division1, division2]
      expect(Division.all()).to(eq(worst_divisions))
    end
  end

  describe("#add_employee") do
    it("associates an employee with the division") do
      division1 = Division.create({:name => "Candy Taste Testing"})
      employee1 = Employee.create({:name => "Clem-Clem"})
      division1.add_employee(employee1)
      expect(employee1.division_id()).to(eq(division1.id))
    end
  end
end
