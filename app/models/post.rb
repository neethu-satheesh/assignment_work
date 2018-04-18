# frozen_string_literal: true

# Post class

class Post < ApplicationRecord
  validates :title, :url, presence: true
  belongs_to :user
end
