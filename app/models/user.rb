# frozen_string_literal: true

# User class

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :validate_email

  private

  def validate_email
    is_valid = EmailValidation.new(email, required: true).valid?
    errors.add(:base, 'Email is invalid') unless is_valid
  end
end
