class AddAbouttoUsers < ActiveRecord::Migration
  def change
    add_column :users, :about, :string
  end
end
