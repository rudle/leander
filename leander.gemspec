Gem::Specification.new do |s|
  s.name = %q{leander}
  s.version = "0.1"
  s.date = %q{2009-12-28}
  s.authors = ["Sean Sorrell"]
  s.email = %q{seansorrell@gmail.com}
  s.summary = %q{leander is a command-line webpage clipper}
  s.homepage = %q{http://github.com/rudle/leander}
  s.description = %q{leander is a command-line webpage clipper}
  s.files = [ "README.md",  "lib/index.rb", "lib/webpage.rb"]
  s.executables = [ "leander"]

  s.add_dependency "ferret"
  s.add_dependency "nokogiri"
  s.add_dependency "highline"
end
