class Column < ApplicationRecord
  belongs_to :board

  validates :title, presence: true
end
