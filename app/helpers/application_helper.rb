# frozen_string_literal: true

module ApplicationHelper
  def is_admin?
    if (current_user.nil? == true) || (current_user.admin? == false)
      false
    elsif current_user.admin? == true
      true
    end
  end
end

include Pagy::Frontend
