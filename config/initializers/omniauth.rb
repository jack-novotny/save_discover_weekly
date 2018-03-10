require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "5bd07298af28433896a3764eb6adfc96", "22aa74a02f5c46abacdba2f48e6963a4", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end