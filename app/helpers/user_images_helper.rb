module UserImagesHelper
  def svg(path)
    return File.read(path).html_safe if File.exists?(path)
  end
end
