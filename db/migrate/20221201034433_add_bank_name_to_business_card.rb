class AddBankNameToBusinessCard < ActiveRecord::Migration[7.0]
  def change
    add_column :business_card, :bank_name, :string
  end
end
