search_terms = ['Red Bull', 'RedBull', 'Energy Drink', 'Energidrikk']

pages << {
    page_type: 'cookie_list',
    freshness: Time.now.utc.strftime("%FT%TZ"),
    url:  "https://spar.no/nettbutikk/varer/drikke/energidrikk",
    headers: {
        "accept"=> 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
        "accept-encoding"=> 'gzip, deflate, br',
        "accept-language"=> 'en-US,en;q=0.5',
        "cache-control"=> 'max-age=0',
        "sec-ch-ua"=> '" Not A;Brand";v="99", "Chromium";v="99", "Google Chrome";v="99"',
        "sec-ch-ua-mobile"=> '?0',
        "sec-ch-ua-platform"=> '"Linux"',
        "sec-fetch-dest"=> 'document',
        "sec-fetch-mode"=> 'navigate',
        "sec-fetch-site"=> 'same-origin',
        "sec-fetch-user"=> '?1',
        "upgrade-insecure-requests"=> '1',
        "user-agent"=> 'Mozilla/5.0 (X11; Linux x86_64; rv:98.0) Gecko/20100101 Firefox/98.0',
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

search_terms.each do |search_term|
    pages << { 
        page_type: 'cookie_list',
        url: "https://spar.no/sok?query=#{search_term}&expanded=products",
        headers: {
            "accept"=> 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
            "accept-encoding"=> 'gzip, deflate, br',
            "accept-language"=> 'en-US,en;q=0.5',
            "cache-control"=> 'max-age=0',
            "sec-ch-ua"=> '" Not A;Brand";v="99", "Chromium";v="99", "Google Chrome";v="99"',
            "sec-ch-ua-mobile"=> '?0',
            "sec-ch-ua-platform"=> '"Linux"',
            "sec-fetch-dest"=> 'document',
            "sec-fetch-mode"=> 'navigate',
            "sec-fetch-site"=> 'same-origin',
            "sec-fetch-user"=> '?1',
            "upgrade-insecure-requests"=> '1',
            "user-agent"=> 'Mozilla/5.0 (X11; Linux x86_64; rv:98.0) Gecko/20100101 Firefox/98.0',
        },
        vars:{
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