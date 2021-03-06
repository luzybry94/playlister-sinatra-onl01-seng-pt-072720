class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.gsub(" ", "-")   
  end

  def self.find_by_slug(slug)
      # name = slug.gsub("-", " ").titleize
      # Song.find_by(name: name)
    
      Song.all.find do |song|
        song.slug == slug
      end
  end
end