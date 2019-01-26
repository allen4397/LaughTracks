RSpec.describe 'When user visits /comedians/new' do
  context 'the user sees a form for a new comedian' do
    it 'shows a field for their name' do
      visit '/comedians/new'

      expect(page).to have_content("Name:")
    end
  end
end
