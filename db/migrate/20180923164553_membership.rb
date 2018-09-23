class Membership < ActiveRecord::Migration[5.2]
  def change
    create_table :membership do |t|
      t.integer :user_id
      t.integer :beer_club_id

      t.timestamps
    end
  end
end
