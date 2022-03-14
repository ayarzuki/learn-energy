search_terms = ['Red Bull', 'RedBull', 'Energy Drink', 'Energidrikk']

if page['vars']['page_type'] == "search"
    search_terms.each do |search_term|
        if page['vars']['search_term'] == search_term
            csrf_token = page['response_cookie'].split("\; ")[0].split("=").last
            pages << {
                page_type: 'listings',
                no_url_encode: true,
                url: "https://platform-rest-prod.ngdata.no/api/episearch/1210/products?search=#{search_term}&page_size=20&suggest=true&page=1&types=suggest,products,articles,recipes,stores&store_id=7080001097950&popularity=true&sort=&facet=;;;;;;&full_response=true&showNotForSale=true",
                headers: {
                    'Host' => 'platform-rest-prod.ngdata.no',
                    'User-Agent' => 'Mozilla/5.0 (X11; Linux x86_64; rv:98.0) Gecko/20100101 Firefox/98.0',
                    'Accept' => '*/*',
                    'Referer' => "https://spar.no/sok?query=#{search_term.gsub(' ', '+').downcase}&expanded=products",
                    'content-type' => 'application/json; charset=utf-8',
                    'fwc-browser-name' => 'Firefox',
                    'fwc-browser-platform' => 'Linux x86_64',
                    'fwc-browser-version' => '98.0',
                    'fwc-chain-id' => '1210',
                    'fwc-framework-versions' => '"unknown"',
                    'fwc-using-api-key' => 'false',
                    'fwc-using-bearer-token' => 'false',
                    'fwc-using-csrf-token' => 'true',
                    'x-csrf-token' => csrf_token,
                },
                vars: {
                    page_number: 1,
                    page_type: 'search',
                    page_category: '-',
                    search_term: search_term
                },
                'http2' => true,
                "driver": { 
                    "name": "scraping energy",
                    "stealth": true,
                    "enbable_images": false,
                }
            }
        end
    end
else
    csrf_token = page['response_cookie'].split("\; ")[0].split("=").last
    pages << {
        page_type: 'listings',
        no_url_encode: true,
        url: "https://platform-rest-prod.ngdata.no/api/products/1210/7080001097950?page=1&page_size=40&full_response=true&fieldset=maximal&facets=Category,Allergen&facet=Categories:Drikke;ShoppingListGroups:Energidrikk&showNotForSale=true",
        headers: {
            'Host' => 'platform-rest-prod.ngdata.no',
            'User-Agent' => 'Mozilla/5.0 (X11; Linux x86_64; rv:98.0) Gecko/20100101 Firefox/98.0',
            'Accept' => '*/*',
            'Referer' => "https://spar.no/nettbutikk/varer/drikke/energidrikk",
            'content-type' => 'application/json',
            'fwc-browser-name' => 'Firefox',
            'fwc-browser-platform' => 'Linux x86_64',
            'fwc-browser-version' => '98.0',
            'fwc-chain-id' => '1210',
            'fwc-framework-versions' => '"unknown"',
            'fwc-using-api-key' => 'false',
            'fwc-using-bearer-token' => 'false',
            'fwc-using-csrf-token' => 'true',
            'x-csrf-token' => csrf_token,
        },
        vars: {
            page_number: 1,
            page_type: 'taxonomy',
            page_category: 'Energidrikk',
            search_term: '-'
        },
        'http2' => true,
        "driver": { 
            "name": "scraping energy",
            "stealth": true,
            "enbable_images": false,
        }
    }
end

# puts page['vars']['page_type'] == "listings"