class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :bio, :string
    add_column :users, :image, :string
    add_column :users, :follows_count, :integer, :default => 0
    add_reference :posts, :author, references: :users, index: true
    add_reference :comments, :author, references: :users, index: true
  end
end
