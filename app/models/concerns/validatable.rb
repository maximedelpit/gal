module Validatable
  def validate!
    update(validated: true)
  end


  def unvalidate!
    update(validated: false)
  end
end
