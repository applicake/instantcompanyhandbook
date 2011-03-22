module UsersHelper

  # if a user is logged in, displays the logout link
  def user_panel
    haml_tag :div, :class => 'user-panel' do
      haml_concat link_to ("Sign out", destroy_user_session_path)
    end if current_user
  end
end
