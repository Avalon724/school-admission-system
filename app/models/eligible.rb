class Eligible < ApplicationRecord
  belongs_to :section

  validates :age, :grade, presence: { message: " cannot be blank" }
end
