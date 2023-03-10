class Article < ApplicationRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :name
      t.text :body
      t.timestamp
    end
  end
end
