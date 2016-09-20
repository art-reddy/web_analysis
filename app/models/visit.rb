DB = Sequel.connect(Rails.configuration.database_configuration[Rails.env])

class Visit < Sequel::Model
    def self.get_top_referrers
        # Get urls visits statisticts for 5 days
        top_records = get_top_urls

        top_records.each do |date, record_per_date|
            # Leave top 10 for every date
            record_per_date = record_per_date.sort_by { |record| -record[:visits]}
            top_records[date] = record_per_date.first(10)

            # Get top 5 referrers for every url
            top_records[date].each do |record|
                record[:referrers] = DB[:visits]
                                        .select(:referrer, Sequel.function(:count).*.as(:visits))
                                        .where(Sequel.cast(:created_at, :date) => date, :url => record[:url])
                                        .exclude(:referrer => nil)
                                        .group(:referrer)
                                        .order(:visits).reverse
                                        .limit(5)
                                        .all
            end
        end

        return top_records
    end

    def self.get_top_urls
        # Use DataSet instead of model itself because it requires less manipulations to get final result
        records = DB[:visits]
                    .where(:created_at => (Date.today - 5)..Date.today)
                    .select_group(Sequel.cast(:created_at, :date).as(:date), :url)
                    .select_append(Sequel.function(:count).*.as(:visits))
                    .all

        return records.group_by { |r| r.delete(:date) }
    end
end
