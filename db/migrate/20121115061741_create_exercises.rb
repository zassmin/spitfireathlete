class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :exercise_name
      t.string :exercise_prescription
      t.references :user

      t.timestamps
    end

      add_index :exercises, :user_id
  end
end
