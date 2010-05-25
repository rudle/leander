require 'rubygems'
require 'sinatra'
require 'haml'

require 'index.rb'
require 'webpage.rb'

helpers do
	def niceify(url, title)
		" <p>#{title}</p><a href=\"#{url}\">#{url}</a>"
	end
end

get '/write/*' do
	puts params
	index = BmIndex.new
	index.store_webpage Webpage.new params[:splat][0]
end


get '/search/:query' do
	index = BmIndex.new
	@search_results = index.search params[:query]
	haml :search, :locals => {:result => @search_results }
end

get '/' do
	haml '%div.title Hello world'
end
