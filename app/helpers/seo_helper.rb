module SeoHelper
  def page_title
    if content_for?(:title)
      "#{content_for(:title)} | USA Foosball"
    else
      "USA Foosball - The United States Foosball Association"
    end
  end

  def page_description
    if content_for?(:description)
      content_for(:description)
    else
      "Find foosball clubs, tournaments, and players near you. Join the United States Foosball Association for competitive play, leagues, and events across America."
    end
  end

  def page_keywords
    if content_for?(:keywords)
      content_for(:keywords)
    else
      "foosball, table soccer, foosball clubs, foosball tournaments, USA foosball, foosball leagues, foosball players, competitive foosball"
    end
  end

  def structured_data_organization
    {
      "@context": "https://schema.org",
      "@type": "Organization",
      "name": "USA Foosball",
      "alternateName": "United States Foosball Association",
      "url": request.base_url,
      "logo": "#{request.base_url}#{asset_path('USA_foosball_logo.png')}",
      "description": "The United States Foosball Association promotes competitive foosball across America with clubs, tournaments, and leagues.",
      "sameAs": [
        "https://www.facebook.com/usafoosball",
        "https://www.instagram.com/usafoosball",
        "https://twitter.com/usafoosball"
      ],
      "address": {
        "@type": "PostalAddress",
        "addressCountry": "US"
      }
    }.to_json.html_safe
  end

  def structured_data_website
    {
      "@context": "https://schema.org",
      "@type": "WebSite",
      "name": "USA Foosball",
      "url": request.base_url,
      "description": "Find foosball clubs, tournaments, and players near you. Join the United States Foosball Association.",
      "potentialAction": {
        "@type": "SearchAction",
        "target": "#{request.base_url}/clubs?state={search_term_string}",
        "query-input": "required name=search_term_string"
      }
    }.to_json.html_safe
  end

  def structured_data_club(club)
    {
      "@context": "https://schema.org",
      "@type": "SportsActivityLocation",
      "name": club.name,
      "description": club.description.present? ? club.description : "Foosball club offering tournaments and recreational play",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": club.address,
        "addressLocality": club.city,
        "addressRegion": club.state,
        "postalCode": club.zip_code,
        "addressCountry": "US"
      },
      "telephone": club.phone,
      "email": club.email,
      "url": club.website,
      "openingHours": club.day_and_time_info,
      "sport": "Foosball"
    }.to_json.html_safe
  end

  def structured_data_article(article)
    {
      "@context": "https://schema.org",
      "@type": "Article",
      "headline": article.title,
      "description": truncate(strip_tags(article.content.to_s), length: 160),
      "author": {
        "@type": "Person",
        "name": article.author
      },
      "datePublished": article.published_at&.iso8601,
      "dateModified": article.updated_at.iso8601,
      "publisher": {
        "@type": "Organization",
        "name": "USA Foosball",
        "logo": {
          "@type": "ImageObject",
          "url": "#{request.base_url}#{asset_path('USA_foosball_logo.png')}"
        }
      },
      "image": article.image_url.present? ? article.image_url : "#{request.base_url}#{asset_path('hero-foosball-dramatic.png')}",
      "mainEntityOfPage": {
        "@type": "WebPage",
        "@id": "#{request.base_url}/news/#{article.slug}"
      }
    }.to_json.html_safe
  end

  def structured_data_breadcrumb(items)
    {
      "@context": "https://schema.org",
      "@type": "BreadcrumbList",
      "itemListElement": items.map.with_index do |item, index|
        {
          "@type": "ListItem",
          "position": index + 1,
          "name": item[:name],
          "item": item[:url]
        }
      end
    }.to_json.html_safe
  end

  def geo_structured_data_for_clubs(clubs)
    return nil if clubs.empty?
    
    {
      "@context": "https://schema.org",
      "@type": "ItemList",
      "name": "Foosball Clubs",
      "description": "Foosball clubs and locations",
      "numberOfItems": clubs.count,
      "itemListElement": clubs.map.with_index do |club, index|
        {
          "@type": "SportsActivityLocation",
          "position": index + 1,
          "name": club.name,
          "address": {
            "@type": "PostalAddress",
            "streetAddress": club.address,
            "addressLocality": club.city,
            "addressRegion": club.state,
            "postalCode": club.zip_code,
            "addressCountry": "US"
          },
          "telephone": club.phone,
          "sport": "Foosball"
        }
      end
    }.to_json.html_safe
  end
end
