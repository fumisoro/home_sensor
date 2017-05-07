require "net/http"
require "irb"
require "uri"
require "json"
require "yaml"
secret = YAML.load_file("./secret.yml")

docomo_uri = "https://api.apigw.smt.docomo.ne.jp/aiTalk/v1/textToSpeech?APIKEY=#{secret['docomo']['api_key']}"
uri = URI.parse "http://weather.livedoor.com/forecast/webservice/json/v1?city=130010"
res = Net::HTTP.start(uri.host, uri.port) do |http|
  http.get "/forecast/webservice/json/v1?city=130010"
end
json = JSON.parse res.body
forecasts = json['forecasts']
forecasts.each do |f|
  case f['dateLabel']
  when '今日'
    puts '今日'
    puts f['telop']
  when '明日'
    puts '明日'
    puts f['telop']
  when '明後日'
    puts '明後日'
    puts f['telop']
  end
end
binding.irb
