class RenameBankNameColumnToBusinessCard < ActiveRecord::Migration[7.0]
  def change
    rename_column :business_cards, :company_name, :company_name
  end
end
