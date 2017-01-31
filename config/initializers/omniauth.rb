Rails.application.config.middleware.use OmniAuth::Builder do
  provider :reddit, 'bctKjkrzmWDBcA', '_2t3QusTKXWxjo9y8MMhsZW1Mks', 
  scope: 'identity'
end