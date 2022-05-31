require 'uri'
require 'net/http'

uri = URI.parse('https://jsonmock.hackerrank.com/api/articles?page=1')
res = Net::HTTP.get_response(uri)
puts res.body if res.is_a?(Net::HTTPSuccess)

hash = JSON.parse(res.body)

p hash["data"][0]["title"]
