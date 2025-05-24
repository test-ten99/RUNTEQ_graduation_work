# if Rails.env.production? && ENV["FLY"] == "true"
#   RSpotify::authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
# end

# if Rails.env.production? && ENV["SPOTIFY_CLIENT_ID"].present? && ENV["SPOTIFY_CLIENT_SECRET"].present?
#   RSpotify::authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])
# end

if ENV["SPOTIFY_CLIENT_ID"].present? && ENV["SPOTIFY_CLIENT_SECRET"].present?
  RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])
else
  Rails.logger.warn("Spotify credentials are missing. RSpotify not authenticated.")
end
