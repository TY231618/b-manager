feature 'viewing links' do
  scenario 'I can see existing links on my link page' do
    Link.create(url: 'http://www.google.com', title: 'Google')

    visit('/links')
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end


 feature 'filtering of tags' do

   scenario 'allows user to filter by tags' do
     visit('/links/new')
     fill_in('title', with: 'West Ham')
     fill_in('url', with: 'http://www.hammers.com')
     fill_in('tag', with: 'bubbles')

     click_button('Create New')
     visit('/links/bubbles')
     expect(page).to have_content('bubbles')
   end
 end
end
