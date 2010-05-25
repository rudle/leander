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



get '/search/*.json' do
	content_type :json
	index = BmIndex.new
	@search_results = index.search params[:splat].first
	@search_results.map! { |r| {:url => r[:url], :title => r[:title]} }.flatten

	output = {}
	@search_results.each_with_index do |r, n| 
		output[n] = {:result => r}
	end
	output.to_s
end

get '/search/:query' do
	index = BmIndex.new
	@search_results = index.search params[:query]
	haml :search, :locals => {:result => @search_results }
end

get '/' do
	haml '%div.title Hello world'
end
