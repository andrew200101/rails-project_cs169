# frozen_string_literal: true

# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
    # Maps a name to a path. Used by the
    #
    #   When /^I go to (.+)$/ do |page_name|
    #
    # step definition in web_steps.rb
    #
    # rubocop:disable Metrics
    def path_to(page_name)
        case page_name

        when /^the home\s?page$/
            '/'

        when /^login page/ then 'login'
        when /^google login/ then '/auth/google_oauth2/callback'
        when /^github login/ then '/auth/github/callback'

        when /^representative MJ/ then 'news_items?representative_id=178'

        when /^the create events page/ then '/my_events/new'
        when /^create new my events/ then '/my_events'

        when /^the my news item page/ then '/my_news_items/new'
        when /^the new news item page/ then '/my_news_items'

        when /^the Texas search page/ then '/search/texas'
        when /^the California search page/ then '/search/california'

        # mapping for part 3
        when /^the map page/ then '/'
        when /^the California state map/ then '/state/CA'
        when /^Alameda County/ then '/search?address=Alameda%20County'
        when /^the search page$/ then '/search'

        when /^the view news item page/ then '/representatives/178/representatives/178/my_news_item/21'
        # Add more mappings here.
        # Here is an example that pulls values out of the Regexp:
        #
        #   when /^(.*)'s profile page$/i
        #     user_profile_path(User.find_by_login($1))

        else
            begin
                page_name =~ /^the (.*) page$/
                path_components = Regexp.last_match(1).split(/\s+/)
                send(path_components.push('path').join('_').to_sym)
            rescue NoMethodError, ArgumentError
                raise "Can't find mapping from \"#{page_name}\" to a path.\n" \
                      "Now, go and add a mapping in #{__FILE__}"
            end
        end
    end
    # rubocop:enable Metrics
end

World(NavigationHelpers)
