class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :flat_no
      t.string :addrline
      t.string :city
      t.string :state
      t.string :country
      t.integer :pin
      t.timestamps
    end
  end
end
