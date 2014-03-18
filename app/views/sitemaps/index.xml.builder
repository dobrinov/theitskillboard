xml.instruct!
xml.urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9") do
  @static_paths.each do |path|
    xml.url do
      xml.loc "#{request.protocol}#{request.host_with_port}#{path}"
      xml.changefreq("weekly")
    end
  end

  @users.each do |user|
    xml.url do
      xml.loc "#{request.protocol}#{request.host_with_port}#{profile_path(user)}"
      xml.changefreq("monthly")
    end
  end
end