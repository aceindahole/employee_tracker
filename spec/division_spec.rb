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
end
