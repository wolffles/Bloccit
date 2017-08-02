module ApplicationHelper
  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << ' has-errors' if errors.any?

    content_tag :div, capture(&block), class: css_class
  end

  def current_user_able_edit_post?(post=nil)
    if post == nil
      current_user && (current_user.moderator? || current_user.admin?)
    else
      current_user && (current_user.moderator? || current_user.admin? || post.user == current_user)
    end
  end
end

def current_user_able_delete_post?(post=nil)
  if post == nil
    current_user && current_user.admin?
  else
    current_user && (current_user.admin? || post.user == current_user)
  end
end
