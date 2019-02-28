feature 'deleting a bookmark' do

  scenario 'a user can delete a bookmark' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    first('.bookmark').click_button("Delete")
    expect(page).not_to have_link('Makers Academy', href:'http://www.makersacademy.com')
  end

end
