# frozen_string_literal: true

module Users
  class Fetch < Command
    include ActiveData::Model

    attribute :user_id, String
    validates :user_id, presence: true

    def call
      validate!
      Response.success(user)
    end

    private

    def user
      User.find(user_id)
    rescue ActiveRecord::RecordNotFound
      raise ActiveRecord::RecordNotFound, RECORD_NOT_FOUND
    end
  end
end
