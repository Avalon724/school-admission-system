class Section < ApplicationRecord
  has_many :students
  has_one :eligible, dependent: :destroy
  validates :name, uniqueness: true, presence: true, format: { with: /\A^[a-z]+$\z/, message: "must be in lower case" }
end
