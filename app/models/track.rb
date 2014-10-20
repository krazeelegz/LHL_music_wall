class Track < ActiveRecord::Base

  validates :author, presence: true
  validates :song_title, presence: true
  validates :url, presence: true
  
end
