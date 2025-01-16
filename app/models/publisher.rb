class Publisher < ApplicationRecord
  validates :name, :country, :general_manager, presence: true, length: { minimum: 3 }
end
