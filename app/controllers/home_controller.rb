class HomeController < ApplicationController
  def index
    @firms = []
    if params[:search]
      q = "%#{params["query"].to_s.downcase}%"
      @firms = Firm.find(:all, :conditions => ["lower(title) like ? OR ico like ? ", q, q])
      contacts = Contact.find(:all, :conditions => ["lower(email) like ? ", q]) || []
      contacts.each { |c| @firms |= [c.address.firm] if c.address and c.address.firm}
      phones = Phone.find(:all, :conditions => ["number like ? ", q]) || []
      phones.each { |pn| @firms |= [pn.contact.address.firm] if pn.contact and pn.contact.address and pn.contact.address.firm }
    end
  end
end
