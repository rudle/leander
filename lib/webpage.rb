require 'rubygems'
require 'open-uri'
require 'nokogiri'

class Webpage
  attr_reader :url, :doc
  def initialize url
    @url = url
    @doc = Nokogiri::HTML(open(url))
  end

  def get_title
    puts @doc.class
    exit
    return @doc.css('title').content
  end

end
