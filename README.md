# Displaying
## Online

- [node_school_20170424](https://darai0512.github.io/talks/node_school_20170424/)
- [gotandajs_20171006](https://darai0512.github.io/talks/gotandajs_20171006/)

## Offline

Using localhost on apache (mac)

http://localhost/~darai0512/talks/<dirname>/

# Tools
## setup reveal.js

```
$wget https://github.com/hakimel/reveal.js/archive/3.1.0.tar.gz
$tar -xzvf 3.1.0.tar.gz -C . 

$vi index.html
# setup theme(= change background and animation)
# XXX.css: http://qiita.com/tbpgr/items/1782561aaa734e5edf8d
<link rel="stylesheet" href="css/theme/XXX.css" id="theme">
  
# setup reading markdown file(= XXX.md) to 'data-' property
<section data-markdown="XXX.md" ...>
```

### get PDF

https://gist.github.com/uupaa/7744760

## setup impress.js

Prepare [Gemfile](https://github.com/tsucchi/ruby-markdown2impress),  
and use the following command if you don't have Gemfile.lock file.

```
$sudo gem install bundler
$bundle
$bundle list
Gems included by the bundle:
  * bundler (1.11.2)
  * eventmachine (1.0.9.1)
  * markdown2impress (0.0.1 f9eaa89)
  * mini_portile2 (2.0.0)
  * nokogiri (1.6.7.2)
  * posix-spawn (0.3.11)
  * pygments.rb (0.6.3)
  * redcarpet (3.3.4)
  * yajl-ruby (1.2.1)
$bundle exec markdown2impress README.md
```

## setup md2gslides

```
$npm install
$npm start -- path/to/file.md
# enter your code => created your slides & token
$ls -l ~/.credentials/md2gslides.json
```

## setup apache

https://qiita.com/darai0512/items/d88662773a070b1bc750#apache
