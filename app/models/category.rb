# frozen_string_literal:true

class Category < ApplicationRecord
  belongs_to :blog
  has_many :articles
  validates :name, presence: true, length: { maximum: 255 }
end
