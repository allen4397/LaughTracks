RSpec.describe Special do
  describe 'Class Methods' do
    it 'should return the average special run time' do
      url_1 = "https://m.media-amazon.com/images/M/MV5BMjIzNzg5NTA2M15BMl5BanBnXkFtZTgwOTY4NjA2MDE@._V1_UY1200_CR135,0,630,1200_AL_.jpg"
      url_2 = "https://m.media-amazon.com/images/M/MV5BOTc2N2I0Y2UtOTgyYy00MTU3LTk1YzItZGIwMDcxY2JkMGQzXkEyXkFqcGdeQXVyMjQzNzk2ODk@._V1_UY268_CR1,0,182,268_AL_.jpg"
      Special.create(name: "New In Town", comedian_id: 1, run_time: 90, image_url: url_1)
      Special.create(name: "Jerry Before Seinfeld", comedian_id: 2, run_time: 60, image_url: url_2)
      expect(Special.average_run_time).to eq(75)
    end
  end

  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        special = Special.create
        expect(special).to_not be_valid
      end
    end
  end
end
