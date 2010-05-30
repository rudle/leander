Gem::Specification.new do |s|
  s.name = %q{leander}
  s.version = "0.2"
  s.date = %q{2009-12-28}
  s.authors = ["Sean Sorrell"]
  s.email = %q{seansorrell@gmail.com}
  s.summary = %q{leander is a command-line webpage clipper}
  s.homepage = %q{http://github.com/rudle/leander}
  s.description = %q{leander is a command-line webpage clipper}
  s.files = [ "README.md",  "lib/leander/index.rb", "lib/leander/webpage.rb", "lib/leander/leander-server.rb" "bin/leander", "bin/leander-server"]
  s.executables = ["leander", "leander-server"]

  s.add_dependency "ferret"
  s.add_dependency "nokogiri"
  s.add_dependency "highline"
  s.add_dependency "sinatra"
  s.add_dependency "json"
  s.add_dependency "haml"
  s.add_dependency "open-uri"
end
