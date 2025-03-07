class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, length: { minimum: 11 }
  validate :date_cannot_be_in_the_past

  private

  def date_cannot_be_in_the_past
    if date.present? && date <= Time.now
      errors.add(:date, "must be greater than the current date and time")
    end
  end
  belongs_to :user
end
