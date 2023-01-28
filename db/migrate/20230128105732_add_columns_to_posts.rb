class AddColumnsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :favorites_count, :integer, :default => 0
    add_column :posts, :description, :string
    add_reference :comments, :post, references: :posts, index: true
  end
end
