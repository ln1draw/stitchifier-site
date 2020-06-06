require "fileutils"

class UserImage < ApplicationRecord
  mount_uploader :stitch_pic, StitchPicUploader

  def stitchify
    FileUtils.touch(stitch_path) if stitched_file?
    stitchified = Stitchifier.new(stitch_pic.path, 75, 10, 15, stitch_path)
  end

  def stitch_path
    sanitized_name = self.name.gsub(/[^0-9A-z.\-]/, '_')
    stitchpath = "#{Rails.root}/public/uploads/stitched/#{id}_#{sanitized_name}_stitched.svg"
  end

  def stitched_file?
    File.exist?(stitch_path)
  end
end
