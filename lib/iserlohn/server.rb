require 'sinatra'

module Iserlohn
  class Server < Sinatra::Base

    set :root, "#{File.dirname(__FILE__)}/../../"

    get '/' do
      @files = List.new
      @host = request.host
      @port = request.port
      erb :index
    end

    post '/upload' do
      @pathinfo = Upload.file(params[:file])
      @files = List.new
      @host = request.host
      @port = request.port
      erb :index
    end

  end
end
