RSpec.describe "when I visit comedians index page" do
  it 'shows me a list of all comedians' do
    mulaney = Comedian.create(name: "John Mulaney", age: 34, city: "Chicago")
    seinfeld = Comedian.create(name: "Jerry Seinfeld", age: 62, city: "Massapequa")

    visit '/comedians'

    expect(page).to have_content("John Mulaney")
    expect(page).to have_content("Jerry Seinfeld")
  end
end
