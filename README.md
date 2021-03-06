# Yml2erd
[![Build Status](https://travis-ci.org/asmsuechan/yml2erd.svg?branch=master)](https://travis-ci.org/asmsuechan/yml2erd)

yml2erd generates erd easily.

![output_image](https://raw.githubusercontent.com/asmsuechan/asmsuechan.github.io/master/images/image.png)

## Installation
Before install this gem, you need to install graphviz.

```
$ brew install graphviz
```

You can get more about graphviz from [here](http://www.graphviz.org/Download..php).

This is how to install yml2erd, just run `gem install yml2erd`

    $ gem install yml2erd

## Usage
Run this,
```
$ yml2erd convert structure.yml
```
and we get output.png.

```
$ yml2erd help convert
Usage:
  yml2erd convert <path>

Options:
  o, [--output=FILE_PATH]          # default: output.png
  p, [--projectname=PROJECT_NAME]  # default: null
  s, [--outputstyle=OUTPUT_STYLE]  # svg or png, default: png

Convert erd from yml
```

## Rule
You must write yml just like below

```yml
# basic format
<table_name>:
  columns:
    - <column_name>: <column_type>
  relations:
    belongs_to:
      - <table_name>
    has_many:
      - <table_name>
  index:
    - <column_name>
```

belongs_to or has_many is not necessary.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/asmsuechan/yml2erd.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
