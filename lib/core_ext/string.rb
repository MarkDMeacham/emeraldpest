class String
  def as_search_param
    "#{self}*".gsub('*', '%').gsub(/%{1,}/, '%')
  end
end