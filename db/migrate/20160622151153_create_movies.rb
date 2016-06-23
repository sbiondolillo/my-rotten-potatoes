class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string 'title'
      t.string 'rating'
      t.datetime 'release_date'
      # Rails auto-tracking fields
      t.timestamps
    end
  end
end
