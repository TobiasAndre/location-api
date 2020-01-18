# frozen_string_literal: true

class User < ApplicationRecord
  before_save :generate_token

  def generate_token
    self.token ||= JWT.encode(payload, Rails.application.secrets.secret_key_base, "HS256")
  end

  def payload
    {
      email: self.email,
      password: self.password_digest
    }
  end
end
