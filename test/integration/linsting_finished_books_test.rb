require 'test_helper'

class LinstingFinishedBooksTest < ActionDispatch::IntegrationTest
  setup do
    @scifi = Genre.create!(name: 'Science Fiction')

    @scifi.books.create!(title: 'Finished', finished_at: 1.day.ago)
    @scifi.books.create!(title: 'Not finished', finished_at: nil)
  end

  test "list finished books in JSON" do
    get '/finished_books', headers: { 'Accept' => 'application/json' }

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type

    assert_equal 1, json(response.body).size
  end

  test "list finished books in XML" do
    get '/finished_books', headers: { 'Accept' => 'application/xml'}

    assert_equal 200, response.status
    assert_equal Mime[:xml], response.content_type

    assert_equal 1, Hash.from_xml(response.body)['books'].size
  end
end
