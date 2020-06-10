require "fileutils"

class UserImage < ApplicationRecord
  validates :name, presence: true
  validates :stitch_pic, presence: true
  validates :acknowledged_privacy, presence: true
  validate :privacy_acknowledged
  mount_uploader :stitch_pic, StitchPicUploader
  after_initialize :set_default_vars

  def privacy_acknowledged
    if acknowledged_privacy == 1 || acknowledged_privacy == true
      puts acknowledged_privacy
      puts "in the if block"
    else
      puts acknowledged_privacy
      puts "in the else block"
      errors.add(:acknowledged_privacy, 'must be checked')
    end
  end

  def set_default_vars
    self.grid_width  ||= 75           #will set the default value only if it's nil
    self.px_size ||= 10
    self.number_of_colors ||= 12
  end

  def stitchify
    FileUtils.touch(stitch_path) if stitched_file?
    stitchified = Stitchifier.new(stitch_pic.path, grid_width, px_size, number_of_colors, stitch_path)
  end

  def stitch_path
    sanitized_name = self.name.gsub(/[^0-9A-z.\-]/, '_')
    stitchpath = "#{Rails.root}/public/uploads/stitched/#{id}_#{sanitized_name}_stitched.svg"
  end

  def stitched_file?
    File.exist?(stitch_path)
  end
end
