# frozen_string_literal: true

class UserSerializer
  include JSONAPI::Serializer

  attributes :username, :email, :phone

  set_id :id
end
