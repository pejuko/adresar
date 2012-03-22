class Phone < ActiveRecord::Base
  FORMAT_REGEXP = /^((?:|\+|00)\d\d\d)?([\d ]+)$/

  validates :number, :format => { :with => FORMAT_REGEXP }

  belongs_to :contact

  # convert number to string separated with space by 3 numbers
  def format_number
    number.to_s.gsub(/\s+/,'') =~ FORMAT_REGEXP
    [$1,$2.to_s.split(/(...)/).map{|x| x.empty? ? nil : x}].flatten.compact.join(' ')
  end
end
