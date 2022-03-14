vars = page['vars']
# p vars

parser_page = Nokogiri.HTML(content)
p parser_page

# title = parser_page.at('h1').text.gsub(/(\n\r|\n|\r|\t|\s|<.*>)+/, ' ').strip
# title = "#{title} #{parser_page.at('.cw-product__variant').text.gsub(/(\n\r|\n|\r|\t|\s)+/, ' ').strip}" rescue title
# p title

# id = page['url'].scan(/(\d+)\?/).first.first
# promotion_text = parser_page.at('.cw-product__over .cw-product__promotion').text.strip rescue ''
# brand = parser_page.at('h1').text.gsub(/(\n\r|\n|\r|\t|\s)+/, ' ').strip 
# brand = 'Red Bull' if brand.include?('Red Bull')

# [
#   /(\d*[\.,]?\d+)\s?([Ff][Ll]\.?\s?[Oo][Zz])/,
#   /(\d*[\.,]?\d+)\s?([Oo][Zz])/,
#   /(\d*[\.,]?\d+)\s?([Ff][Oo])/,
#   /(\d*[\.,]?\d+)\s?([Ee][Aa])/,
#   /(\d*[\.,]?\d+)\s?([Ff][Zz])/,
#   /(\d*[\.,]?\d+)\s?(Fluid Ounces?)/,
#   /(\d*[\.,]?\d+)\s?([Oo]unce)/,
#   /(\d*[\.,]?\d+)\s?([Mm]l)/,
#   /(\d*[\.,]?\d+)\s?([Ll])/,
#   /(\d*[\.,]?\d+)\s?(cc)/i,
#   /(\d*[\.,]?\d+)\s?([Cc][Ll])/,
#   /(\d*[\.,]?\d+)\s?([Gg])/,
#   /(\d*[\.,]?\d+)\s?([Gg]r)/i,
#   /(\d*[\.,]?\d+)\s?([Ll]itre)/,
#   /(\d*[\.,]?\d+)\s?([Ll]itro[s]?)/i,
#   /(\d*[\.,]?\d+)\s?([Ll]ts)/i,
#   /(\d*[\.,]?\d+)\s?([Ss]ervings)/,
#   /(\d*[\.,]?\d+)\s?([Pp]acket\(?s?\)?)/,
#   /(\d*[\.,]?\d+)\s?([Cc]apsules)/,
#   /(\d*[\.,]?\d+)\s?([Tt]ablets)/,
#   /(\d*[\.,]?\d+)\s?([Tt]ubes)/,
#   /(\d*[\.,]?\d+)\s?([Cc]hews)/
# ].find { |regexp| title =~ regexp }
# item_size = $1
# uom = $2

# match = [
#   /x\s(\d+)$/i,
#   /x\s?(\d+)\sboks$/i,
#   /(\d+)\s?und/i,
#   /Pack of (\d+)/,
#   /(\d+)\s?Pack/i,
#   /Pack (\d+)/i,
#   /Box of (\d+)/,
#   /Case of (\d+)/,
#   /(\d+)\s?[Cc]ount/,
#   /(\d+)\s?unidades/i,
#   /(\d+)\s?[Cc][Tt]/,
#   /(\d+)[\s-]?Pack($|[^e])/,
#   /(\d+)\s?[Pp][Kk]/
# ].find { |regexp| title =~ regexp }
# in_pack = match ? $1 : '1'
# in_pack = '4' if title.include?('Four Pack')
# in_pack = '2' if title.include?('Duo Pack')

# description = parser_page.at('.cw-product__description').text.gsub(/\.\.\.|Les mer/, '').strip rescue nil
# image_url = parser_page.at('.cw-product__image img').attr('src')
# price = parser_page.at('span[itemprop="price"]').text
# is_available = parser_page.at('.cw-product__unavailable').nil? ? 1 : ''

# info = {
#   _collection: 'products',
#   RETAILER_ID: '0191',
#   RETAILER_NAME: 'spar_no',
#   GEOGRAPHY_NAME: 'NO',
#   # - - - - - - - - - - -
#   SCRAPE_INPUT_TYPE: vars['page_type'],
#   SCRAPE_INPUT_SEARCH_TERM: vars['search_term'],
#   SCRAPE_INPUT_CATEGORY: vars['page_category'],
#   SCRAPE_URL_NBR_PRODUCTS: vars['total'],
#   SCRAPE_URL_NBR_PROD_PG1: vars['total_pg1'],
#   # - - - - - - - - - - -
#   PRODUCT_BRAND: brand,
#   PRODUCT_RANK: vars['rank'],
#   PRODUCT_PAGE: vars['page_number'],
#   PRODUCT_ID: id,
#   PRODUCT_NAME: title,
#   PRODUCT_DESCRIPTION: description,
#   PRODUCT_MAIN_IMAGE_URL: image_url,
#   PRODUCT_ITEM_SIZE: (item_size rescue ''),
#   PRODUCT_ITEM_SIZE_UOM: (uom rescue ''),
#   PRODUCT_ITEM_QTY_IN_PACK: (in_pack rescue ''),
#   PRODUCT_STAR_RATING: '',
#   PRODUCT_NBR_OF_REVIEWS: '',
#   SALES_PRICE: price,
#   IS_AVAILABLE: is_available,
#   PROMOTION_TEXT: promotion_text,
#   EXTRACTED_ON: Time.now.to_s
# }

# outputs << info