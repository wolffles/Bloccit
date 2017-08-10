module UsersHelper
  def has_posts?(user)
    !(user.posts.empty?) ? (render user.posts) : "#{user.name} has not submitted any posts yet."
  end

  def has_comments?(user)
    !(user.comments.empty?) ? (render user.comments) : "#{user.name} has not submitted any comments yet."
  end

  #def has_favorites?(user)
  #  !(user.favorites.empty?) ? (render user.favorites) : "#{user.name} has not submitted any favorites yet."
  #end
end
