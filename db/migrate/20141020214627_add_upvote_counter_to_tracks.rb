class AddUpvoteCounterToTracks < ActiveRecord::Migration

  def change
    add_column :tracks, :upvotes, :integer    
  end

end
