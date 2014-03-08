class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :notes
      t.boolean :complete, :default => false
      t.belongs_to :list

      t.timestamps
    end
  end
end
