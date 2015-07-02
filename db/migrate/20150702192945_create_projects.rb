class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.column :url, :string
      t.column :title, :string
      t.column :description, :string
    end
  end
end
