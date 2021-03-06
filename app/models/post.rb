class Post < ActiveRecord::Base
  validates_presence_of :title
  has_many :comments
  has_many :post_categoryships
  has_many :categories, :through => :post_categoryships
  belongs_to :user
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
end
