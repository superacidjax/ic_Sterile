# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://secure.icouch.me"
SitemapGenerator::Sitemap.sitemaps_host = "http://icouchproductions3.amazonaws.com/"
SitemapGenerator::Sitemap.public_path = 'uploads/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new

SitemapGenerator::Sitemap.create do
  
  add '/', :changefreq => 'daily', :priority => 1.0
  add '/accounts/sign_in', :priority => 0.2
  add '/privacy_policy', :changefreq => 'monthly', :priority => 0.2
  add '/terms_of_service', :changefreq => 'monthly', :priority => 0.2
  add '/faqs', :changefreq => 'monthly', :priority => 0.2
  add '/about_online_counseling', :changefreq => 'monthly', :priority => 0.2
  add '/about_us', :changefreq => 'monthly', :priority => 0.2
  add '/media', :changefreq => 'monthly', :priority => 0.2
  add '/counselors/', :changefreq => 'always', :priority => 1.0
    Counselor.find_each do |counselor|
    add counselor_path(counselor), :lastmod => counselor.updated_at
    end
  add '/client_terms_of_service', :changefreq => 'monthly', :priority => 0.2
  add '/contact', :changefreq => 'monthly', :priority => 0.2
  add '/how_does_therapy_work', :changefreq => 'monthly', :priority => 0.2
  add '/ethical_code', :changefreq => 'monthly', :priority => 0.2
  add '/the_lounge', :changefreq => 'weekly', :priority => 0.2
  add '/therapy_styles', :changefreq => 'monthly', :priority => 0.2
  add '/counselor_info', :changefreq => 'monthly', :priority => 0.2
  add '/counselor_lounge', :changefreq => 'weekly', :priority => 0.2
  add '/counselor_first_steps', :changefreq => 'monthly', :priority => 0.2
  add 'about_icouch_security', :changefreq => 'monthly', :priority => 0.2
  add 'about_icouch_therapists', :changefreq => 'monthly', :priority => 0.2
  add 'how_icouch_works', :changefreq => 'monthly', :priority => 0.2
  add 'meet_the_petersons', :changefreq => 'monthly', :priority => 0.2
  add 'meet_emma', :changefreq => 'monthly', :priority => 0.2
  add 'meet_enrico_and_julie', :changefreq => 'monthly', :priority => 0.2
  add 'meet_martin', :changefreq => 'monthly', :priority => 0.2
  
  
end
