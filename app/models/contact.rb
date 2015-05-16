class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :telephone, uniqueness: true

  paginates_per 25
end
