class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :kind
      t.decimal :relevance
      t.references :note

      t.timestamps
    end
  end
end
