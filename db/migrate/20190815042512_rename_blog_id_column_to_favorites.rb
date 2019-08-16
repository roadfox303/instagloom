class RenameBlogIdColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :blog_id, :article_id
  end
end
