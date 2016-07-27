class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :text
      t.references :release
      t.references :company

      t.timestamps
    end
  end
end
