class RepositoriesController < ApplicationController
  
  def index
    resp = Faraday.get('https://api.github.com/user') do |req|
      req.headers['Authorization'] = "token #{session[:token]}"
    end

    body = JSON.parse(resp.body)
    @user = body["login"]

    resp = Faraday.get('https://api.github.com/user/repos') do |req|
      req.headers['Authorization'] = "token #{session[:token]}"
    end

    body = JSON.parse(resp.body)
    @repos = body.map {|x| x["name"]}

  end

  def create
    binding.pry
    Faraday.post('https://api.github.com/user/repos') do |req|

    end
  end
end
