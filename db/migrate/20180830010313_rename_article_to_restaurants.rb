class RenameArticleToRestaurants < ActiveRecord::Migration[5.2]
  def change
    rename_column :restaurants, :title, :article
  end
end
