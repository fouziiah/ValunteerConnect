# frozen_string_literal: true

class CreateOpportunity < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :email, presence: true
  validates :organization_name, presence: true
end
