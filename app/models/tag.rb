class Tag < ActiveRecord::Base
  has_and_belongs_to_many :businesses
  scope :filterable, -> { where(filterable: true) }
  scope :not_filterable, -> { where(filterable: false) }
end
