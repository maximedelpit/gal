module Extensions
  module ActsAsTaggableOn
    module Tag
      include Validatable
    end
  end
end

ActsAsTaggableOn::Tag.prepend Extensions::ActsAsTaggableOn::Tag
