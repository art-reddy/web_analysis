class StatsController < ApplicationController
    def top_urls
        render :json => Visit.get_top_urls
    end

    def top_referrers
        render :json => Visit.get_top_referrers
    end
end
