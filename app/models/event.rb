# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :room
  validates :title, presence: true #これにより無記入投稿とエンター長押しの連続投稿の2つが同時に防げる
end
