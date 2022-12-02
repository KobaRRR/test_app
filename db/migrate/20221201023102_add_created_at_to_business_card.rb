class AddCreatedAtToBusinessCard < ActiveRecord::Migration[7.0]
  def chang
    add_column :business_card, :created_at, :datetime
  end
end
