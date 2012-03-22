module ContactsHelper
  def join_phones(contact)
    contact.phones.map { |phone|
      phone.format_number
    }.delete_if{|n| n.to_s.empty?}.join(', ')
  end
end
