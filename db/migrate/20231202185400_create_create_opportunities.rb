class CreateCreateOpportunities < ActiveRecord::Migration[7.1]
  def change
    create_table :create_opportunities do |t|
      t.string :title
      t.text :description
      t.string :location
      t.date :date
      t.time :time
      t.string :email

      t.timestamps
    end
  end
end
