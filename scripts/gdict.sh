re "open-uri"
require "json"
require "cgi"

ARGV.each { |word|
  response = open("http://www.google.com/dictionary/json?callback=dict_api.callbacks.id100&q=#{CGI.escape(word)}&sl=en&tl=en&restrict=pr,de").read
    results = JSON.parse(response.sub(/dict_api.callbacks.id100\(/, "").sub(/,200,null\)$/, ""))
      next unless results["primaries"]
        results["primaries"][0]["entries"].select { |e| e["type"] == "meaning" }.each { |entry|
            puts word + ": " + entry["terms"][0]["text"].gsub(/x3c\/?(em|i|b)x3e/, "").gsub("x27", "'")
              }
          }
