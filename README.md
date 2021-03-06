# Leander

Leander is a command line HTML clipping utility written in Ruby.

## Why?

I wrote this to replace my old method of bookmarking - "xclip -o | perl -pi -e 's:$:\\n\\n:g' >> ~/.bookmarks".

This provides a nicer way to search for links and get some context when the time comes to retrieve one.

## Install

I've tested this with ruby 1.8.7 (and now 1.9.1) on Arch Linux. I offer no guarantees to its performance.
The simplest way to install is probably 'gem install leander', although that may be flakey.

## Help
usage: leander 'query' OR leander
 query bookmarks or store a bookmark from URL on STDIN

specific options
        -d, --delete                     deletes all documents matching the given query from the index 
        --show-html                  print out the HTML stored for each URL provided
        --hide-url                   hide URL : useful with --show-html to pipe output to a browser
    -h, --help                       Show this message

#### Reccomended Usage
I use Xmonad, and I use leander like this:

((modMask .|. shiftMask, xK_t), spawn "xclip -o | leander")

Combined with Vimperator's 'yy' command to yank the current URL, it's pretty slick.

#### leander-server
leander features a sinatra-based server component

		# leander-server&
		# curl http://localhost:4567/search/leander
			<p class='results'>
				<p>rudle's leander at master - GitHub</p><a href="http://github.com/rudle/leander">
				http://github.com/rudle/leander
				</a>
			</p>
		# curl http://localhost:4567/api/search/leander
		{"0":{"result":{"url":"http://github.com/rudle/leander\n","title":"rudle's leander at master - GitHub"}}}

We can also write a new bookmark using /write/http://domain.tld

#### The Name
http://en.wikipedia.org/wiki/Leander_(clipper)
