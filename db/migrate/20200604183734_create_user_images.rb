class CreateUserImages < ActiveRecord::Migration[6.0]
  def change
    create_table :user_images do |t|
      t.string :name
      t.string :stitch_pic

      t.timestamps
    end
  end
end
