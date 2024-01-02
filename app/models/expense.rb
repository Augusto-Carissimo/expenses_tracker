class Expense < ApplicationRecord
  scope :current_month, -> { where('created_at > ?', (DateTime.current - 1.months)) }

  belongs_to :type
end
