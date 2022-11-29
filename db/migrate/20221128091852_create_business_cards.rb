class CreateBusinessCards < ActiveRecord::Migration[7.0]
  def change
    create_table :business_cards do |t|
      t.integer :user_id
      t.integer :bank_code
      t.string :department
      t.string :division
      t.string :name
      t.string :phone_num
      t.text :remarks

      t.timestamps
    end
  end
end
