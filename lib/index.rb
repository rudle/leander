require 'ferret'
require 'highline/import'

require 'webpage.rb'

include Ferret

class BmIndex
	attr_accessor :index

	def initialize
		@index = Index::Index.new(:path => "#{ENV['HOME']}/.leander.idx")
	end

	def store_webpage(wp)
		@index << {
			:url => wp.url,
			:doc => wp.doc
		}
	end

	def leander_remove query
		@index.search_each(query) do |id, score|
			agrees = HighLine.agree("Are you sure you want to delete #{@index[id][:url]} Y/n?") { |q| q.default = 'yes'}
			if agrees then @index.delete(id) end
		end
	end

	def search(query)
		output = []
		@index.search_each(query) do |id, score|
			doc = Nokogiri::HTML.parse(@index[id][:doc])
			tmp = {}
			tmp[:url] = index[id][:url]
			tmp[:title] = doc.css('title').inner_text.strip
			tmp[:doc] = doc
			output << tmp
		end

		return output
	end
end
