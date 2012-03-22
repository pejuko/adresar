class Contact < ActiveRecord::Base
  #validates :email, :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  belongs_to :address
  has_many :phones

  accepts_nested_attributes_for :phones, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k,v| v.blank? }}
end
