class Student < ApplicationRecord
  belongs_to :section
  belongs_to :user
  has_one_attached :photo
  has_many_attached :marksheets

  validates :name, :father, :mother, format: { with: /\A[A-Za-z ]+\z/, message: "only letters are allowed" }
  validates :name, presence: { message: " cannot be blank" }
  validates :father, presence: { message: "\'s name cannot be blank" }
  validates :mother, presence: { message: "\'s name cannot be blank" }
  validates :age, presence: true, numericality: { less_than: 20, message: " must be less than 20 years" }
  validates :address, presence: true
  validates :pnumber, presence: true, length: { in: 10..11, too_long: "%{count} digits is maximum allowed" }
  validates :prevgrade, presence: true
  validates :marksheets, presence: true, attached: true, content_type: { in: "application/pdf", message: "is not a PDF" }, size: { less_than: 5.megabytes, message: " is too large!" }
end
