class Interview < ApplicationRecord
  belongs_to :student

  enum status: {
    not_interviewed: 0,
    passed: 1,
    failed: 2,
  }

  validates :schedule, presence: true
end
