require 'bookmark'
require 'rails_helper'
require 'database_helpers'

describe Bookmark do

  describe '.all' do
    it 'returns all bookmarks' do

      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      # bookmark is the makers academy site
      # bookmark = (id, http://www.makersacademy.com, Makers Academy)
      # persisted_data =  persisted_data(id: bookmark.id)
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all #create method adds the websites into database

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
      end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      # creating a test bookmark - inserting into database. connecting to database , extracting it again into a different object and returning it from create method
      persisted_data =  persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
end
    #tests for delete passes - wrote feature test, added button in form and added request in controller
    describe '.delete' do
      it 'deletes the specified bookmark' do
        bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
        Bookmark.delete(id: bookmark.id)
        expect(Bookmark.all.length).to eq 0
      end
    end

    describe '.update' do
      it 'allows user to update the bookmark' do
        bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
        updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')

        expect(updated_bookmark).to be_a Bookmark
        expect(updated_bookmark.id).to eq bookmark.id
        expect(updated_bookmark.title).to eq 'Snakers Academy'
        expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
      end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end


end
