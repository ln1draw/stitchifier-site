class UserImage < ApplicationRecord
  mount_uploader :stitch_pic, StitchPicUploader
end
