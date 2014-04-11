class CreateTherapies < ActiveRecord::Migration
  def change
    create_table :therapies do |t|
      t.string :name
      t.string :therapy
      t.string :address

      t.timestamps
    end
  end
end
