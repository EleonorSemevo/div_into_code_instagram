module PostsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_posts_path
    else
      post_path
    end
  end
end
