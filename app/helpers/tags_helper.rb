module TagsHelper
  def font_size(tag)
    %~#{70 + (100 * tag.firms.size.to_f / Firm.all.size)}%~
  end
end
