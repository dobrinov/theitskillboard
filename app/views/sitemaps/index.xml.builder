xml.instruct!
xml.urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9") do
  @static_paths.each do |path|
    xml.url do
      xml.loc "#{request.protocol}#{request.host_with_port}#{path}"
      xml.changefreq("monthly")
    end
  end
end