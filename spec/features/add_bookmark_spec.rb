feature 'add bookmark' do

  # scenario 'submit a bookmmark via form' do
  #   visit('/bookmarks/new')
  #   fill_in(:add_bookmark, with: 'http://www.testbookmark.com')
  #   click_button 'Go!'
  #   # expect(page).to have_content('bookmark added' && 'http://www.testbookmark.com')
  # end

  scenario 'submit a bookmmark via form' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end


end
