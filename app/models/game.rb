class Game < ApplicationRecord
  belongs_to :publisher
  belongs_to :platform

  validates :title, :genre, presence: true, length: { minimum: 3 }
  validates :releaseDate, presence: true
  validate :release_date_is_valid

  def formatted_genre
    genre.titleize
  end

  def age
    return nil unless releaseDate
    (Date.today - releaseDate).to_i / 365
  end

  private

  def release_date_is_valid
    if releaseDate.present? && releaseDate > Date.today
      errors.add(:releaseDate, "can't be in the future")
    elsif releaseDate.present? && releaseDate < 50.years.ago.to_date
      errors.add(:releaseDate, "can't be more than 50 years ago")
    end
  end
end
