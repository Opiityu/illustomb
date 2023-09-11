class CreateWhies < ActiveRecord::Migration[6.1]
  def change
    create_table :whies do |t|
      t.integer :end_user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
