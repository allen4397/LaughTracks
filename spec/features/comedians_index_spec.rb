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

    it 'shows a thumbnail image for each special' do
      mulaney = Comedian.create(name: "John Mulaney", age: 34, city: "Chicago")
      seinfeld = Comedian.create(name: "Jerry Seinfeld", age: 62, city: "Massapequa")
      url_1 = "https://m.media-amazon.com/images/M/MV5BMjIzNzg5NTA2M15BMl5BanBnXkFtZTgwOTY4NjA2MDE@._V1_UY1200_CR135,0,630,1200_AL_.jpg"
      url_2 = "https://m.media-amazon.com/images/M/MV5BOTc2N2I0Y2UtOTgyYy00MTU3LTk1YzItZGIwMDcxY2JkMGQzXkEyXkFqcGdeQXVyMjQzNzk2ODk@._V1_UY268_CR1,0,182,268_AL_.jpg"
      new_in_town = Special.create(name: "New In Town", comedian_id: 1, run_time: 80, image_url: url_1)
      jerry_before_seinfeld = Special.create(name: "Jerry Before Seinfeld", comedian_id: 2, run_time: 80, image_url: url_2)

      visit '/comedians'

      within '#comedian-1' do
        expect(page).to have_css("img[src*='#{url_1}']")
      end

      within '#comedian-2' do
        expect(page).to have_css("img[src*='#{url_2}']")
      end
    end
  end

  describe 'in the area of the page called statistics' do
    it 'shows me the average age of all the comedians on the page' do
      mulaney = Comedian.create(name: "John Mulaney", age: 34, city: "Chicago")
      seinfeld = Comedian.create(name: "Jerry Seinfeld", age: 62, city: "Massapequa")

      visit '/comedians'

      within '#statistics' do
        expect(page).to have_content("Average Age: #{Comedian.average_age}")
      end
    end

    it 'shows me the average run time of all the specials on the page' do
      mulaney = Comedian.create(name: "John Mulaney", age: 34, city: "Chicago")
      seinfeld = Comedian.create(name: "Jerry Seinfeld", age: 62, city: "Massapequa")
      url_1 = "https://m.media-amazon.com/images/M/MV5BMjIzNzg5NTA2M15BMl5BanBnXkFtZTgwOTY4NjA2MDE@._V1_UY1200_CR135,0,630,1200_AL_.jpg"
      url_2 = "https://m.media-amazon.com/images/M/MV5BOTc2N2I0Y2UtOTgyYy00MTU3LTk1YzItZGIwMDcxY2JkMGQzXkEyXkFqcGdeQXVyMjQzNzk2ODk@._V1_UY268_CR1,0,182,268_AL_.jpg"
      new_in_town = Special.create(name: "New In Town", comedian_id: 1, run_time: 90, image_url: url_1)
      jerry_before_seinfeld = Special.create(name: "Jerry Before Seinfeld", comedian_id: 2, run_time: 60, image_url: url_2)

      visit '/comedians'

      within '#statistics' do
        expect(page).to have_content("Average TV Special Run Time: #{Special.average_run_time}")
      end
    end

  end
end
