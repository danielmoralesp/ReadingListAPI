require 'test_helper'

class DeletingBooksTest < ActionDispatch::IntegrationTest
  setup do
    @scifi = Genre.create!(name: 'Science Fiction')

    @scifi.books.create!(title: 'Pragmatic Programmer')
  end

  test 'delete books' do
    delete "/books/#{@scifi.id}"

    assert_equal 204, response.status
  end
end
