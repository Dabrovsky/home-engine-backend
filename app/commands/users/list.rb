# frozen_string_literal: true

module Users
  class List < Command
    def call
      Response.success(users)
    end

    private

    def users
      User.all
    end
  end
end
