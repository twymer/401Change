class ChangeAgent
  def self.count
    return 0
  end

  def self.valid?(form_values)
    !form_values.empty? &&
        valid_name?(form_values[:name]) &&
        valid_email?(form_values[:email])
  end

  def self.valid_name?(name)
    name != ""
  end

  def self.valid_email?(email)
    email != ""
  end
end
