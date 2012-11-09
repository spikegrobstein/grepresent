# Grepresent

Pattern-matching text formatter for the commandline.

Designed to highlight text piped to STDIN, `grepresent` is great for locating
different strings as they come out of grep.

## Installation

Install it yourself as:

    $ gem install grepresent

This will put a `grepresent` executable in your PATH.

## Demo

Once installed, you can see `grepresent` in action by running the following
command:

    echo "ruby is a pretty cool language" | grepresent -f ruby red -f language yellow,on_blue,bold -f pretty underline,green

## Usage

The current version of `grepresent` reads data from STDIN and uses the `-f` switch
to define a formatter. Basic usage is:

    grepresent -f <pattern> <format>

`pattern` can be any string or regex. Format is a comma-delimited list of
`Term::ANSIColor` format values. Each pair of `pattern`/`format` is called a
formatter.

Because `grepresent` reads strictly from STDIN, all the following examples assume
that you're piping something into it; for example:

    grep -R def app | grepresent -f if bold,blue

You can specify any number of `format`s for a single pattern, as follows:

    grepresent -f spike bold,yellow,on_blue

You can also specify multiple formatters in a single call to grepresent:

    grepresent -f spike red -f unix green,underline -f windows black,on_blue

It's also possible to chain calls to `grepresent`:

    grepresent -f spike red | grepresent -f unix green,underline | grepresent -f windows black,on_blue

Which would have an identical effect to the previous example.

The pattern is actually a regular expression, so if you wanted to format the output
of a call to `grep` so that the filename at the beginning of each line is grey:

    grepresent -f '^.+?:' white,on_black,dark

There is also a dry-run mode (`-d` or `--dry-run`) which gives a run-down of all of
the formatters that have been defined along with a sample of what the formatter
will render as.

If the option is used anywhere in the call, it will be treated as a dry-run.

## Limitations, TODOs and Gotchas

Grepresent is not quite ready for prime time. Following are some limitations.

 * All regexes are case-sensitive.
 * There is no validation for formats, yet.
 * There is some weirdness if multiple formatters overlap and it can cause
 unexpected results.
 * It ONLY reads from STDIN. At some point I'd like to have an option to take a file
 * The commandline usage is not set in stone and will probably change before the 1.0
 release.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Author

Written by Spike Grobstein

me@spike.cx  
http://spike.grobste.in  
https://github.com/spikegrobstein

## License

Grepresent is licensed under the MIT license. See `LICENSE.txt` file.
