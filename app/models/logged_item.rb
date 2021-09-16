require 'color'

class LoggedItem < ApplicationRecord
  VALID_VALUE_TYPES = ['spectrum', 'number', 'binary', 'selection']

  # ASSOCIATIONS
  belongs_to :user
  has_many :logs

  # VALIDATIONS
  validates_presence_of :name, :value_type
  validates :value_type, inclusion: VALID_VALUE_TYPES

  # CALLBACKS

  def button_color
    @button_color ||= Color::CODES.keys.sample
  end
end
