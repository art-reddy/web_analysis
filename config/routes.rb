Rails.application.routes.draw do
    get '/top_urls', to: 'stats#top_urls', :defaults => { :format => 'json' }
    get '/top_referrers', to: 'stats#top_referrers', :defaults => { :format => 'json' }
end
