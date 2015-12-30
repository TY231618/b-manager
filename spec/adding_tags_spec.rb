feature 'adding tags' do
  scenario 'allows user to add a tag to their links' do
    visit('links/new')
    fill_in(:title, with: 'Yahoo')
    fill_in(:url, with: 'http://www.yahoo.com')
    fill_in(:tag, with: 'social')
    click_button('Create New')
    # expect(current_path).to eq '/links'
    # within 'ul#links' do
    #   expect(page).to have_content('social')
    # end
    link = Link.first
    expect(link.tags.map(&:tag)).to include('social')
  end
end
