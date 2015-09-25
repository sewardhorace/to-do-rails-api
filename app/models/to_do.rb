class ToDo < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }
  validates :priority, numericality: true, allow_nil: true
  belongs_to :group
end
