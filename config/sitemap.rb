# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "simpliflyco.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  #Static Pages
  add '/stratus-finance'
  add '/meritize'
  add '/accelerated-pilot-training'
  add '/flexible-pilot-training'
  add '/why-simplifly'
  add '/financing'
  add '/pilot-training-pricing-calculator'
  add '/approximate-pilot-training-costs'
  add '/timeline-to-be-a-pilot'
  add '/multi-engine-rating'
  add '/commercial-pilot-training'
  add '/instrument-rating'
  add '/private-pilot-training'
  add '/pilot-training'
  add '/airline-pilot-courses'
  add '/pilot-programs'
  add '/our-team'

  #Blog
  add '/blog'

  #Forms
  add '/enroll-at-simplifly'
  add '/contact'
  add '/visit-simplifly'
  add '/instruct-at-simplifly'
  add '/discovery-flight'


end
