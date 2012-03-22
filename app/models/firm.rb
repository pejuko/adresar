class Firm < ActiveRecord::Base
  validates :title, :presence => true, :uniqueness => true
  validates :ico,   :presence => true, :uniqueness => true

  has_many :addresses
  has_and_belongs_to_many :tags
  
  accepts_nested_attributes_for :tags, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k,v| v.blank? }}
  accepts_nested_attributes_for :addresses, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k,v| v.blank? }}
end
