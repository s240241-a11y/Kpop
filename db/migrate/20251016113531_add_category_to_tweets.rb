class AddCategoryToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :category, :string
  end
end
