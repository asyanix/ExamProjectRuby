class Platform < ApplicationRecord
  has_many :games, dependent: :restrict_with_error

  validates :name, :releaseDate, :manufacturer, presence: true
  validates :name, :manufacturer, length: { minimum: 3 }
  validate :release_date_is_valid

  def age
    return nil unless releaseDate
    (Date.today - releaseDate).to_i / 365
  end

  def has_games?
    if games.exists?
      "Yes"
    else
      "No"
    end
  end

  private

  def release_date_is_valid
    if releaseDate.present? && releaseDate > Date.today
      errors.add(:releaseDate, "can't be in the future")
    end

    if releaseDate.present? && releaseDate < 50.years.ago.to_date
      errors.add(:releaseDate, "can't be more than 50 years ago")
    end
  end
end
