# # require './lib/helpers'
search_terms = ["Red Bull", "RedBull", "Energy Drink", "Energidrikk"]
#csrf_token = ENV['csrf_token']
csrf_token = page["response_cookie"].split("\; ").detect { |i| i.include? "_app_token_" }.split("=").last rescue nil
pages << {
  page_type: "listings",
  freshness: Time.now.utc.strftime("%FT%TZ"),
  # url:  "https://platform-rest-prod.ngdata.no/api/products/1210/7080001097950?page=1&page_size=40&full_response=true&fieldset=maximal&facets=Category%2CAllergen&facet=Categories%3ADrikke%3BShoppingListGroups%3AEnergidrikk&showNotForSale=false", # "https://spar.no/nettbutikk/varer/drikke/energidrikk",
  url: "https://platform-rest-prod.ngdata.no/api/products/1210/7080001097950?page=1&page_size=40&full_response=true&fieldset=maximal&facets=Category,Allergen&facet=Categories:Drikke;ShoppingListGroups:Energidrikk&showNotForSale=true",
  no_url_encode: true,
  headers: {
    "Host" => "platform-rest-prod.ngdata.no",
    "User-Agent" => "Mozilla/5.0 (X11; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0",
    "Accept" => "*/*",
    "Referer" => "https://spar.no/nettbutikk/varer/drikke/energidrikk",
    "content-type" => "application/json",
    "fwc-browser-name" => "Firefox",
    "fwc-browser-platform" => "Linux x86_64",
    "fwc-browser-version" => "76.0",
    "fwc-chain-id" => "1210",
    "fwc-framework-versions" => '"unknown"',
    "fwc-using-api-key" => "false",
    "fwc-using-bearer-token" => "false",
    "fwc-using-csrf-token" => "true",
    "x-csrf-token" => csrf_token,
  },
  # http2: true,
  vars: {
    page_number: 1,
    page_type: "taxonomy",
    page_category: "Energidrikk",
    search_term: "-",
  },
}

search_terms.each do |search_term|
  pages << {
    page_type: "listings",
    #url: "https://platform-rest-prod.ngdata.no/api/episearch/1210/products?search=#{search_term.gsub(' ', '%20')}&page_size=20&page=1&types=products%2Crecipes%2Cstores%2Carticles&store_id=7080001266110&popularity=true&facet=%3B%3B%3B%3B%3B%3B&full_response=true",
    # url: "https://platform-rest-prod.ngdata.no/api/episearch/1210/all?types=suggest,products,articles,recipes,stores&search=#{search_term}&page_size=20&suggest=true&full_response=true&store_id=7080001097950&popularity=true&showNotForSale=false",
    url: "https://platform-rest-prod.ngdata.no/api/episearch/1210/products?search=#{search_term.gsub(" ","%20")}&page_size=20&suggest=true&page=1&types=suggest,products,articles,recipes,stores&store_id=7080001097950&popularity=true&sort=&facet=;;;;;;&full_response=true&showNotForSale=true",
    no_url_encode: true,
    headers: {
      "Host" => "platform-rest-prod.ngdata.no",
      "User-Agent" => "Mozilla/5.0 (X11; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0",
      "Accept" => "*/*",
      "Referer" => "https://spar.no/sok?query=#{search_term.gsub(" ", "+").downcase}&expanded=products",
      "content-type" => "application/json",
      "fwc-browser-name" => "Firefox",
      "fwc-browser-platform" => "Linux x86_64",
      "fwc-browser-version" => "76.0",
      "fwc-chain-id" => "1210",
      "fwc-framework-versions" => '"unknown"',
      "fwc-using-api-key" => "false",
      "fwc-using-bearer-token" => "false",
      "fwc-using-csrf-token" => "true",
      "x-csrf-token" => csrf_token,
    },
    # http2: true,
    vars: {
      page_number: 1,
      page_type: "search",
      page_category: "-",
      search_term: search_term,
    },
  }
end
