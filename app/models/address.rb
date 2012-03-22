class Address < ActiveRecord::Base
  validate :city,   :presence => true
  validate :street, :presence => true
  validate :psc,    :presence => true

  belongs_to :firm
  has_many   :contacts

  accepts_nested_attributes_for :contacts, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k,v| v.blank? }}
end
