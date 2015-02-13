class CreateUrlShorteners < ActiveRecord::Migration
  def change
    create_table :url_shorteners do |t|
      t.integer :user_id
      t.string :original_url
      t.string :shortened_url

      t.timestamps
    end
  end
end
