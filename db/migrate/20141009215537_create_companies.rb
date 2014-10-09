class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.timestamps null: false
      t.string :name
      t.string :website
      t.string :full_address
      t.string :city
      t.string :state
      t.string :zipcode
    end
  end
end
