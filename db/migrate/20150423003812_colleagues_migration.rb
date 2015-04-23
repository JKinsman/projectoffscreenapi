class ColleaguesMigration < ActiveRecord::Migration
  def change
    add_column :users, :colleagues_enabled, :boolean
    add_column :users, :colleagues_journalist, :boolean
    add_column :users, :colleagues_pharmacist, :boolean
    add_column :users, :colleagues_office_assistant, :boolean
    add_column :users, :colleagues_ceo, :boolean
    add_column :users, :colleagues_accountant, :boolean
    add_column :users, :colleagues_professor, :boolean
    add_column :users, :colleagues_software_engineer, :boolean
  end
end
