class User < ActiveRecord::Base
  has_many :evaluations
  has_many :rosters
  has_many :group_relations, source: :groups
  has_many :groups, through: :group_relations
  has_many :courses, through: :rosters
  has_many :projects, through: :group_relations

  devise :database_authenticatable
         enum status: [:available, :pending, :requested, :accepted]

  def password_required?
    false
  end

  def password_valid?
    true
  end

##FOR IMAGE UPLOADING
has_attached_file :avatar, 
:path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
:url => "/system/:attachment/:id/:basename_:style.:extension",
default_url: 'missing_avatar.jpg',
:styles => {
  :thumb    => ['100x100#',  :jpg, :quality => 70],
  :preview  => ['480x480#',  :jpg, :quality => 70],
  :large    => ['600>',      :jpg, :quality => 70],
  :retina   => ['1200>',     :jpg, :quality => 30]
},
:convert_options => {
  :thumb    => '-set colorspace sRGB -strip',
  :preview  => '-set colorspace sRGB -strip',
  :large    => '-set colorspace sRGB -strip',
  :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
}
##VALIDATE UPLOAD IS AN IMAGE
validates_attachment :avatar,
    #:presence => false,
    :size => { :in => 0..8.megabytes },
    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }
end
