module ApplicationHelper

  def gtm_suffix_link
    if params[:controller] == 'devise/sessions' && params[:action] == 'new'
      return '-login'
    elsif params[:controller] == 'devise/registrations' && params[:action] == 'new'
      return '-signup'
    else
      return '-other'
    end
  end

  def retina_image_tag(default_name, options={})
    retina_name = default_name.gsub(%r{\.\w+$}, '@2x\0')
    image_tag(default_name, options.merge('data-interchange' => "[#{asset_path(retina_name)}, (retina)]"))
  end

  def password_required?(user)
    user.state == 'registered' ? false : true
  end

  def set_profile_path
    current_user.state == 'registered' ? edit_user_registration_path :  edit_user_path
  end

  def industry_subies_collection
    return IndustrySubcategory.left_outer_joins(:subcategories).select(:name, :id).where(%Q(
      industry_subcategories.validated = 'true' OR
      (industry_subcategories.validated = 'false' AND subcategories.user_id = #{current_user.id})
    )).distinct(:name).order(:name)
    # (IndustrySubcategory.where(validated: true) || current_user.industry_subies.where(validated: false))
  end

  def prospect_areas_collection
    return ProspectArea.left_outer_joins(:zones).select(:name, :id).where(%Q(
      prospect_areas.validated = 'true' OR
      (prospect_areas.validated = 'false' AND zones.user_id = #{current_user.id})
    )).distinct(:name).order(:name)
    # (ProspectArea.where(validated: true) || current_user.prospect_areas.where(validated: false))
  end

  def user_tags_collection
    return ActsAsTaggableOn::Tag.left_outer_joins(:taggings).where(%Q(
      tags.validated = 'true' OR
      (tags.validated = 'false' AND taggings.taggable_id = #{current_user.id} AND taggings.taggable_type = 'User')
    )).distinct(:name).order(:name)
    # tag_ids = ActsAsTaggableOn::Tagging.where(taggable_type: 'IndustrySubcategory').or(
    #   ActsAsTaggableOn::Tagging.where(taggable_type: 'User', taggable_id: current_user.id)
    # ).distinct(:tag_id).pluck(:tag_id)
    # return ActsAsTaggableOn::Tag.where(id: tag_ids)
  end

  def buyer_sweet_data
    data = {
      imageUrl: 'https://unsplash.it/400/200',
      imageWidth: 400,
      imageHeight: 200,
      imageAlt: 'Buy a lead with Get a Lead',
      animation: false,
      confirm: t('.buyer_alert_title'),
      text: t('.buyer_alert_text')
    }
    if user_signed_in?
      data.merge!({confirmButtonText: 'Connect'})
    end
    return data
  end

end
