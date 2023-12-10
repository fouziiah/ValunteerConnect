# frozen_string_literal: true

class CreateCreateOpportunities < ActiveRecord::Migration[7.1]
  def change
    create_table :create_opportunities do |t|
      t.string :title
      t.text :description
      t.string :organization_name
      t.string :location
      t.date :date
      t.time :time
      t.string :email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
