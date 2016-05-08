class AddDefaultValueToSubredditsSubscribed < ActiveRecord::Migration
  def change
    change_column :subreddits, :subscribed, :boolean, default: true
  end
end
