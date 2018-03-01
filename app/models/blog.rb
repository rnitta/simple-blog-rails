# frozen_string_literal:true

class Blog < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy
  has_many :categories, dependent: :destroy
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :url, presence: true,
                  length: { maximum: 255 },
                  format: { with: /\w/ },
                  uniqueness: true
end
