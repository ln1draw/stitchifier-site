class AddsVariablesToUserImage < ActiveRecord::Migration[6.0]
  def change
    add_column :user_images, :grid_width, :integer
    add_column :user_images, :px_size, :integer
    add_column :user_images, :number_of_colors, :integer
    add_column :user_images, :acknowledged_privacy, :integer
  end
end
