class AddColumnToBusinessCard < ActiveRecord::Migration[7.0]
  def change
    add_column :business_cards, :company_name, :string
  end
end
