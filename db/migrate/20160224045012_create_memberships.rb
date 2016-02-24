class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :cafe_id
      t.integer :count

      t.timestamps null: false
    end
  end
end
