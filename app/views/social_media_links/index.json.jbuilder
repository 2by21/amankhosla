json.array!(@social_media_links) do |social_media_link|
  json.extract! social_media_link, :id, :name, :url
  json.url social_media_link_url(social_media_link, format: :json)
end
