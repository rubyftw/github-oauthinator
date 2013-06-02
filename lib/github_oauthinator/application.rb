module GithubOauthinator
  class Application < Sinatra::Application
    get '/auth/:code' do
      response = HTTParty.post(
        'https://github.com/login/oauth/access_token',

        query: {
          client_id: ENV["GITHUB_CLIENT_ID"],
          client_secret: ENV["GITHUB_CLIENT_SECRET"],
          code: params[:code] }
      )

      data = Hash[response.body.split("&").map {|p| p.split("=") }]

      "#{params[:callback]}({ 'access_token' : '#{data['access_token']}' })"
    end
  end
end
