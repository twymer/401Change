class ChangeAgent
  def self.count
    return 0
  end

  def self.valid?(form_values)
    if form_values.empty?
      return false
    else
      return true
    end
  end
end
