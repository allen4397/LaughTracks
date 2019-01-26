RSpec.describe Comedian do
  describe 'Class Methods' do
    it 'should return the average comedian age' do
      Comedian.create(name: "John Mulaney", age: 34, city: "Chicago")
      Comedian.create(name: "Jerry Seinfeld", age: 62, city: "Massapequa")
      expect(Comedian.average_age).to eq(48)
    end
  end

  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comic = Comedian.create(age: 48)
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg')
        expect(comic).to_not be_valid
      end
    end
  end
end
