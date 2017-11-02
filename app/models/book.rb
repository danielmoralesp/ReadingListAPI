class Book < ApplicationRecord
  scope :finished, ->{ where('finished_at IS NOT NULL') }
end
