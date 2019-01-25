RSpec.describe "when I visit comedians index page" do
  it 'shows me a list of all comedians names, ages and cities' do
    mulaney = Comedian.create(name: "John Mulaney", age: 34, city: "Chicago")
    seinfeld = Comedian.create(name: "Jerry Seinfeld", age: 62, city: "Massapequa")

    visit '/comedians'

    within '#comedian-1' do
      expect(page).to have_content("John Mulaney")
      expect(page).to have_content(34)
      expect(page).to have_content("Chicago")
    end

    within '#comedian-2' do
      expect(page).to have_content("Jerry Seinfeld")
      expect(page).to have_content(62)
      expect(page).to have_content("Massapequa")
    end
  end

  it "shows me each comedians tv specials" do
    mulaney = Comedian.create(name: "John Mulaney", age: 34, city: "Chicago")
    seinfeld = Comedian.create(name: "Jerry Seinfeld", age: 62, city: "Massapequa")
    new_in_town = Special.create(name: "New In Town", comedian_id: 1)
    comeback_kid = Special.create(name: "The Comeback Kid", comedian_id: 1)
    jerry_before_seinfeld = Special.create(name: "Jerry Before Seinfeld", comedian_id: 2)

    visit '/comedians'

    within '#comedian-1' do
      expect(page).to have_content("New In Town")
      expect(page).to have_content("The Comeback Kid")
    end

    within '#comedian-2' do
      expect(page).to have_content("Jerry Before Seinfeld")
    end
  end

  context 'Where I see a list of each comedians TV specials names' do
    it 'shows each specials run-time length in minutes, and a thumbnail image' do
      mulaney = Comedian.create(name: "John Mulaney", age: 34, city: "Chicago")
      seinfeld = Comedian.create(name: "Jerry Seinfeld", age: 62, city: "Massapequa")
      new_in_town = Special.create(name: "New In Town", comedian_id: 1, run_time: 80)
      jerry_before_seinfeld = Special.create(name: "Jerry Before Seinfeld", comedian_id: 2, run_time: 80)

      visit '/comedians'

      within '#comedian-1' do
        expect(page).to have_content(80)
      end

      within '#comedian-2' do
        expect(page).to have_content(80)
      end
    end
  end
end
