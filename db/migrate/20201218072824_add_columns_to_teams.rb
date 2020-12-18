class AddColumnsToTeams < ActiveRecord::Migration[6.0]
  def up
    change_column :teams, :email, :string, null: false, unique: true
    add_column :teams, :name, :string, null: false, default: 'チーム名未設定'
    add_column :teams, :town, :string,  null: false, default: '地域未設定'
    add_column :teams, :introduction, :string, null: false, default: 'チーム紹介未設定'
    add_reference :teams, :prefecture, foreign_key: true, default: 48
  end

  def down
    change_column :teams, :email, :string, null: false
    remove_column :teams, :name, :string
    remove_column :teams, :town, :string
    remove_column :teams, :introduction
    remove_reference :teams, :prefecture
  end
end
