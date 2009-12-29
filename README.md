# Leander

Leander is a command line HTML clippingtgi utility written in Ruby.

## Why?

I wrote this to replace my old method of bookmarking - "xclip -o | perl -pi -e 's:$:\\n\\n:g' >> ~/.bookmarks".

This provides a nicer way to search for links and get some context when the time comes to retrieve one.

## Help
usage: leander 'query' OR leander\n
 query bookmarks or store a bookmark from URL on STDIN\n

specific options\n
        --show-html                  print out the HTML stored for each URL provided\n
        --hide-url                   hide URL : useful with --show-html to pipe output to a browser\n
    -h, --help                       Show this message

#### Reccomended Usage
I use Xmonad, and I use leander like this:

((modMask .|. shiftMask, xK_t), spawn "xclip -o | leander")

Combined with Vimperator's 'yy' command to yank the current URL, it's pretty slick.

#### The Name
http://en.wikipedia.org/wiki/Leander_(clipper)
