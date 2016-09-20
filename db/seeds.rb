require 'date'
require 'digest'

# Not sure why it doesn't get connection information from database.yml by default
DB = Sequel.connect(Rails.configuration.database_configuration[Rails.env])
visits = DB[:visits]

records_num = 1e6
chunk_size = 2e4

urls = [
    'http://apple.com',
    'https://apple.com',
    'https://www.apple.com',
    'http://developer.apple.com',
    'http://en.wikipedia.org',
    'http://opensource.org',
    'http://store.apple.com/us',
    'https://www.tumblr.com',
    'https://www.transferbigfiles.com',
    'https://www.outlook.com',
    'https://www.cia.gov',
    'https://addons.mozilla.org',
    'http://yelp.com',
    'http://www.ya.com',
    'http://www.xbox.com',
    'http://www.worldofwarcraft.com',
    'http://www.worldlingo.com/en/products_services/worldlingo_translator.html',
    'http://www.wmtransfer.com',
    'http://www.wikileaks.org',
    'http://www.walmart.com',
    'http://www.vatican.va',
    'http://www.usaid.gov',
    'http://www.translate.ru',
    'http://www.state.gov/g/drl/',
    'http://www.pcgamer.com'
]

referrers = urls + [nil]
now = Time.now

# Let's pretend we have statistics for the last 30 days
start_date = now - 30 * 24 * 60 * 60

records = Array.new

visits.delete

for id in (1..records_num)
    url = urls.sample
    referrer = referrers.sample
    time = rand(start_date..now)
    record = {id: id, url: url, created_at: time}

    unless referrer.nil?
        record[:referrer] = referrer
    end

    hash = Digest::MD5.hexdigest(record.to_s)

    record[:hash] = hash

    records.push([id, url, referrer, time, hash])

    # Import in chunks of 20000 records. Otherwise MySQL server will die if we try to import the full set
    if id % chunk_size == 0
        visits.import([:id, :url, :referrer, :created_at, :hash], records)
        records.clear
    end
end

puts "#{Time.now - now} sec"
