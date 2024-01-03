class Expense < ApplicationRecord
  scope :current_month, -> { where('created_at > ?', (DateTime.current - 1.months)) }

  belongs_to :type

  validates :cost, numericality: { greater_than_or_equal_to: 0 }
end
