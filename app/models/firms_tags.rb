class FirmsTags < ActiveRecord::Base
  belongs_to :firm
  belongs_to :tag
end
