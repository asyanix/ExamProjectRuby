class Publisher < ApplicationRecord
  has_many :games, dependent: :restrict_with_error

  validates :name, :country, :general_manager, presence: true, length: { minimum: 3 }

  def has_games?
    if games.any?
      "Yes"
    else
      "No"
    end
  end

  def formatted_general_manager
    general_manager.titleize
  end

  def formatted_country
    country.titleize
  end
end
