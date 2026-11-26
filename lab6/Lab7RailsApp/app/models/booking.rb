class Booking < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validate :acceptable_image

  validates :building, :room, :booked_by, :starts_at, :ends_at, presence: true
  validates :floor, numericality: { only_integer: true }
  validates :description, presence: true, length: { in: 20..1000 }

  validate :ends_after_start

  private

  def acceptable_image
    return unless image.attached?

    allowed_types = %w[image/jpeg image/png image/webp]

    unless allowed_types.include?(image.content_type)
      errors.add(:image, "має бути у форматі JPEG, PNG або WebP")
    end

    if image.byte_size > 5.megabytes
      errors.add(:image, "має бути розміром до 5 МіБ")
    end
  end

  def ends_after_start
    return if starts_at.blank? || ends_at.blank?
    return if ends_at > starts_at

    errors.add(:ends_at, "має бути пізніше за час початку")
  end
end