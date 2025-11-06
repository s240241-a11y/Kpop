class AddKpopToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :kpop, :string
  end
end
