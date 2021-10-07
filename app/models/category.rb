class Category < ApplicationRecord
  belongs_to :quote, optional: true
end
