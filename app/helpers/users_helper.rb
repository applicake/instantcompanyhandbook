module UsersHelper

  # if a user is logged in, displays the logout link
  def user_panel
    haml_tag :div, :class => 'user-panel' do
      links = {
        "Handbooks" => handbooks_path,
        "Photos" => photos_path,
        "Sign out" => destroy_user_session_path
      }.collect { |key, value| link_to(key, value) }
      haml_concat (links.join " | ")
    end if current_user
  end
end
