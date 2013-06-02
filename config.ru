require 'bundler'
Bundler.require

require './lib/github_oauthinator'

run GithubOauthinator::Application
