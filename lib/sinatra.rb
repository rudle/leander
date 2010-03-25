require 'sinatra'
require 'haml'

require 'index.rb'


get '/search/:query' do |q|
	@index = BmIndex.new
	@output = @index.search("github", false, false).to_s
	"<pre>#{@output}</pre>"
end

get '/' do
	haml :index
end
