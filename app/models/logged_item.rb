require 'color'

class LoggedItem < ApplicationRecord
  VALID_VALUE_TYPES = ['spectrum', 'number', 'binary', 'selection', 'consistency']

  # ASSOCIATIONS
  belongs_to :user
  has_many :logs

  # VALIDATIONS
  validates_presence_of :name, :value_type, :color
  validates :value_type, inclusion: VALID_VALUE_TYPES
  validates :color, inclusion: Color.names.map(&:to_s)

  # CALLBACKS
  before_validation :set_color

  private

    def set_color
      self.color = Color.names.sample if self.color.blank?
    end
end
