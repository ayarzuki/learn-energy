pages << {
    page_type: "cookie",
    method: "GET",
    url: "https://spar.no",
    freshness: Time.now.utc.strftime('%FT%TZ'),
    fetch_type: "browser",
    headers: {
      "Connection" => "keep-alive",
      "Upgrade-Insecure-Requests" => "1",
      "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36",
      "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
      "Accept-Encoding" => "gzip, deflate, br",
      "Accept-Language" => "en-US,en;q=0.9",
    },
}
  