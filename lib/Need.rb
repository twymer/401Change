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

  def self.get_errors_with_form(form_values)
    errors = {}
    if !valid_email?(form_values[:email])
      errors[:email] = "OH NOES YOU FAIL!"
    end
    if !valid_name?(form_values[:name])
      errors[:name] = "OH NOES YOU FAIL!"
    end
    errors
  end
end
