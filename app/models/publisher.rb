class Publisher < ApplicationRecord
  has_many :games, dependent: :restrict_with_error

  validates :name, :country, :general_manager, presence: true, length: { minimum: 3 }
end
