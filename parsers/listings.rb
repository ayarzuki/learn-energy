vars = page["vars"]
# data = page['vars']['page_type'] == 'search' ? JSON.parse(content)["products"] : JSON.parse(content)
data = JSON.parse(content)

total = data["hits"]["total"]
products = data["hits"]["hits"]
total_per_page = vars["page_type"] == "search" ? 20 : 40

if (vars["page_number"] == 1) && (total.to_i > total_per_page)
  total_pages = (total.to_f / total_per_page).ceil.to_i
  (2..total_pages).each do |pn|
    if vars["page_type"] == "search"
      # url = "https://platform-rest-prod.ngdata.no/api/episearch/1300/products?search=#{vars["search_term"].gsub(" ", "%20")}&page_size=20&page=#{pn}&types=products%2Crecipes%2Cstores%2Carticles&store_id=7080000886050&popularity=true&facet=%3B%3B%3B%3B%3B%3B&full_response=true"
      # url = "https://platform-rest-prod.ngdata.no/api/episearch/1210/all?types=suggest,products,recipes,stores,articles&search=#{page["vars"]["search_term"]}&page_size=20&page=#{pn}&suggest=true&full_response=true&store_id=7080001266110&popularity=true"
      # url = "https://platform-rest-prod.ngdata.no/api/episearch/1210/all?types=suggest,products,recipes,stores,articles&search=#{page["vars"]["search_term"]}&page_size=20&page=#{pn}&suggest=true&full_response=true&store_id=7080001097950&popularity=true&showNotForSale=false"
      url = "https://platform-rest-prod.ngdata.no/api/episearch/1210/products?search=#{page["vars"]["search_term"].gsub(" ","%20")}&page_size=20&suggest=true&page=#{pn}&types=suggest,products,articles,recipes,stores&store_id=7080001097950&popularity=true&sort=&facet=;;;;;;&full_response=true&showNotForSale=true"
      
    else
      # url = "https://platform-rest-prod.ngdata.no/api/products/1210/7080001266110?page=#{pn}&page_size=42&full_response=true&fieldset=maximal&facets=Category,Allergen&facet=Categories:Drikke;ShoppingListGroups:Energidrikk"
      # url = "https://platform-rest-prod.ngdata.no/api/products/1210/7080001097950?page=#{pn}&page_size=42&full_response=true&fieldset=maximal&facets=Category,Allergen&facet=Categories:Drikke;ShoppingListGroups:Energidrikk&showNotForSale=false"
      url = "https://platform-rest-prod.ngdata.no/api/products/1210/7080001097950?page=#{pn}&page_size=40&full_response=true&fieldset=maximal&facets=Category,Allergen&facet=Categories:Drikke;ShoppingListGroups:Energidrikk&showNotForSale=true"
    end
    pages << {
      page_type: "listings",
      freshness: Time.now.utc.strftime("%FT%TZ"),
      #url: "https://platform-rest-prod.ngdata.no/api/episearch/1210/products?search=#{vars['search_term'].gsub(' ', '%20')}&page_size=20&page=#{pn}&types=products%2Crecipes%2Cstores%2Carticles&store_id=7080001266110&popularity=true&facet=%3B%3B%3B%3B%3B%3B&full_response=true",
      url: url,
      no_url_encode: true,
      headers: page["headers"],
      # http2: true,
      vars: {
        page_number: pn,
        page_type: vars["page_type"],
        page_category: vars["page_category"],
        search_term: vars["search_term"],
      },
    }
  end
end
products.each_with_index do |product, i|
  if page['vars']['page_type'] == 'search'
    url = "https://spar.no/nettbutikk/varer#{product["contentData"]["_source"]["slugifiedUrl"]}"
  else
    url = "https://spar.no/nettbutikk/varer#{product["_source"]["slugifiedUrl"]}"
  end
  total_pg1 = vars["page_number"] == 1 ? products.count : total_per_page
  pages << {
    page_type: "product",
    url: "#{url}?pt=#{vars["page_category"]}#{vars["search_term"]}#{vars["page_number"]}-#{i + 1}",
    # headers: headers,
    http2: true,
    vars: {
      page_number: vars["page_number"],
      page_type: vars["page_type"],
      page_category: vars["page_category"],
      search_term: vars["search_term"],
      total: total,
      total_pg1: total_pg1,
      rank: (i + 1),
    },
  }
end
