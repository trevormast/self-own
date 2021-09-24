class Log < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :logged_item

  # VALIDATIONS
  validates_presence_of :value
end
