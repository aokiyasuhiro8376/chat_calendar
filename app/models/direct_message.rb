# frozen_string_literal: true

class DirectMessage < ApplicationRecord
  belongs_to :user
  belongs_to :room
  # ブロードキャスト
  after_create_commit { DirectMessageBroadcastJob.perform_later self }
  validates :content, presence: true #これにより無記入投稿とエンター長押しの連続投稿の2つが同時に防げる
end
