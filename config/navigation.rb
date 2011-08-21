# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :users, 'Användare', users_path do |sub_nav|
      sub_nav.item :new, 'Ny användare', new_user_path
    end
  end

end
