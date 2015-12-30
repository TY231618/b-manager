feature 'creating links' do
  scenario 'allows user to add links' do
    visit('/links/new')
    fill_in(:title, with: 'Yahoo')
    fill_in(:url, with: 'http://www.yahoo.com')
    click_button('Create New')
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content('Yahoo')
    end
  end
end
