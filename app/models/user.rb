# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  validates :phone, presence: true
  validates :user_type, presence: true

  has_many :create_opportunities

  def organization?
    user_type == 'organization'
  end

  def volunteer?
    user_type == 'volunteer'
  end
end
