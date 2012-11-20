class CreateHighfives < ActiveRecord::Migration
  def change
    create_table :highfive do |t|
      t.boolean :highfive
      t.references :highfiveable, :polymorphic => true
    
      t.timestamps
    end
  end
end
