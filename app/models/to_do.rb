class ToDo < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5 }
                    
  belongs_to :group
end
