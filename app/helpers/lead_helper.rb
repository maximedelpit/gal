module LeadHelper


  def field_message(field_name, options={})
    key = options[key] || ["1", "2", "3"].sample
    return t(".#{field_name}#{key}", options.merge(default: t(".#{field_name}1")))
  end

  def grant?
    "#{field_message('grant', {name: current_user&.first_name})}&&" if [true, false].sample
  end

  def lead_intro_message
    return field_message('intro', {name: current_user&.first_name})
  end

  def make_it_bot?
    return [true, false].sample ? {"cf-form" => 'test'} : {}
  end
end
