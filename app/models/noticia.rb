class Noticia < ActiveRecord::Base
  validates_presence_of :titulo

  has_attached_file :imagem, :styles => { :medium => "300x300>", :thumb=> "100x100>" }
  validates_attachment_content_type :imagem, :content_type => %w(image/jpg image/jpeg image/pjpeg image/gif image/png image/x-png application/msword application/pdf)
  validates_attachment_size :imagem, :less_than => 5.megabytes

end
