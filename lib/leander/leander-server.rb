#!/usr/bin/ruby

require 'sinatra/base'
require 'haml'
require 'json'

require 'leander/index.rb'
require 'leander/webpage.rb'

class LeanderServer < Sinatra::Base

	set :root, File.dirname(__FILE__)

	helpers do
		def niceify(url, title)
			" <p>#{title}</p><a href=\"#{url}\">#{url}</a>"
		end
	end

	get '/write/*' do
		index = BmIndex.new
		index.store_webpage Webpage.new params[:splat][0]
	end


	get '/search/:query' do
		index = BmIndex.new
		@search_results = index.search params[:query]
		haml :search, :locals => {:result => @search_results }
	end

	get '/api/search/:query' do
		content_type :json
		index = BmIndex.new
		@search_results = index.search params[:query].first
		@search_results.map! { |r| {:url => r[:url], :title => r[:title]} }.flatten

		output = {}
		@search_results.each_with_index do |r, n| 
			output[n] = {:result => r}
		end
		output.to_json
	end


	get '/' do
		haml '%div.title Hello world'
		BmIndex.new
	end

end
