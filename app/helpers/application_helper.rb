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

  def user_tags_collection
    return ActsAsTaggableOn::Tag.joins(:taggings).where(taggings: {taggable_type: 'IndustrySubcategory'}).order(:name)
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
