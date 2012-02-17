require "paperclip"
class Documento < ActiveRecord::Base
  belongs_to :c_externo

  validates_presence_of :titulo, :c_externo
  validates_associated :c_externo

  has_attached_file :documento, :styles=>{:medium=>"300x300>", :thumb =>"100x100>"}, :whiny => false
  

end
