require 'ferret'

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

  def search(query, show_html = false, hide_url = false)
    @index.search_each(query) do |id, score|
      doc =  Nokogiri::HTML.parse(@index[id][:doc])
      puts @index[id][:url] + "\t" + doc.css('title').inner_text.strip unless hide_url
      if show_html then puts @index[id][:doc] end
    end
  end
end
