class CreateSolutions < ActiveRecord::Migration[7.0]
  def change
    create_table :solutions do |t|
      t.references :party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
