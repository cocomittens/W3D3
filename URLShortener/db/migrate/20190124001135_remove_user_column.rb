class RemoveUserColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :shortened_urls, :user
    add_column :shortened_urls, :user_id, :integer
  end
end
