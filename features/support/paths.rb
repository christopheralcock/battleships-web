# Taken from the cucumber-rails project.

module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    when /the name page/
      '/name'
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
  when /the new game page/
    '/newgame'

  when /the successful name page/
    '/name?name=Fred'

  when /the battleship page/
    '/battleship'

  when /the cruiser page/
    '/cruiser'

  when /the destroyer page/
    '/destroyer'

  when /the submarine page/
    '/submarine'

  when /the boardplaced page/
    '/boardplaced'

  when /the playgame page/
    '/playgame'

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
