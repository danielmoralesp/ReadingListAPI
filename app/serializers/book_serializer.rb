class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :rating, :author, :review, :rating, :genre_id, :amazon_id
end
