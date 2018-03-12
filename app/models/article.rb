# frozen_string_literal:true

class Article < ApplicationRecord
  belongs_to :blog
  belongs_to :category
  validates :title, presence: true, length: { maximum: 255 }
  validates :name, presence: true,
                   length: { maximum: 255 },
                   format: { with: /\A\w+\z/ },
                   uniqueness: { scope: :blog_id }
  extend FriendlyId
  friendly_id :name
end
