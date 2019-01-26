RSpec.describe 'When user visits /comedians/new' do
  context 'the user sees a form for a new comedian' do
    it 'shows a field for their name' do
      visit '/comedians/new'

      expect(page).to have_content("Name:")
    end

    it 'shows a field for their age' do
      visit '/comedians/new'

      expect(page).to have_content("Age:")
    end

    it 'shows a field for their city' do
      visit '/comedians/new'

      expect(page).to have_content("City:")
    end

    it 'can add an submitted new comedian to the index page' do
      visit '/comedians/new'
      fill_in 'name', with: "Amy Schumer"
      fill_in 'age', with: 37
      fill_in 'city', with: "New York City"

      expect(page).to have_button('Submit')
      click_on "Submit"

      expect(page).to have_content("Amy Schumer")
    end
  end
end
