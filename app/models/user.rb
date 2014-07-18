class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
#, :lockable, :timeoutable and :omniauthable   
  has_and_belongs_to_many :courses
  # has_many :groups
  has_many :groups, :through => :projects
  # has_many :inverse_groups, :class_name => "group", :foreign_key => "campus_id"
  # has_many :inverse_groups, :through => :inverse_groups, :source => :user


  self.primary_key = "campus_id"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  enum role: [:user, :vip, :admin]
  #user = student
  #vip = Professor
  #admin = admin
  after_initialize :set_default_role, :if => :new_record?
     
      def password_required?
        false
        #super if confirmed?
      end


  def set_default_role
    self.role ||= :user
  end

def password_valid?
    true
end

  #    #group associations?
  # has_many :groups, :class_name => "group", :foreign_key => "user_id", :dependent => :destroy
  # has_many :accepted_groups, -> {where 'group_status_id = ?', 2}, :class_name => "group"
  # has_many :pending_groups, :class_name => "group"
  # has_many :groups_initiated_by_me, :class_name => "group", :foreign_key => "user_id",  :dependent => :destroy
  # has_many :groups_not_initiated_by_me, :class_name => "group", :foreign_key => "user_id", :dependent => :destroy
  # has_many :occurances_as_group, :class_name => "group", :foreign_key => "group_id", :dependent => :destroy



##FOR IMAGE UPLOADING
has_attached_file :avatar, 
:path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
:url => "/system/:attachment/:id/:basename_:style.:extension",
default_url: '/assets/missing_avatar.jpg',
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
