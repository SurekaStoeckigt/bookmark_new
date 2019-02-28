require 'pg'

class Bookmark

  def self.all
    self.choose_env
    bookmarks = @connection.exec("SELECT * FROM bookmarks;")
    bookmarks.map { |bookmark| bookmark['url'] }
  end

  def self.create(url:, title:)
    self.choose_env
    @connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}','#{url}') RETURNING id, url, title")
  end

  def self.choose_env
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end

end
