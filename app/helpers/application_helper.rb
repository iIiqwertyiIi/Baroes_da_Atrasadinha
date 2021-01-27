module ApplicationHelper

  def is_admin?
    if current_user.nil? == true or current_user.admin? == false
      return false
    elsif current_user.admin? == true
      return true
    end
  end
end

include Pagy::Frontend

