# frozen_string_literal:true

class Blog < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :name, presence: true,
                   length: { maximum: 255 },
                   format: { with: /\w/ },
                   uniqueness: true
end
