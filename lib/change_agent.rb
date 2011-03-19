class ChangeAgent
  def self.count
    return 0
  end

  def self.valid?(form_values)
    !form_values.empty? && form_values[:name] != ""
  end
end
