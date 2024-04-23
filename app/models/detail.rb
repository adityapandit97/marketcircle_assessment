class Detail < ApplicationRecord
  #Association
  belongs_to :person

  #validation
  validates :email, presence: true
end
