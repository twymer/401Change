class ChangeAgent
  def self.count
    return 0
  end

  def self.valid?(form_values)
    !form_values.empty?
  end
end
