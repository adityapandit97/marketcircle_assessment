class Person < ApplicationRecord
  #Association
  has_one :detail, dependent: :destroy
  accepts_nested_attributes_for :detail, allow_destroy: true

  #validation
  validates :name, presence: true
end
