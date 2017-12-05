module UserHelper
  def set_mail_value
    return @user.email if @user.state == 'registered'
    @user.errors.present? && @user.errors[:email].blank? ? @user.email : nil
  end
end
