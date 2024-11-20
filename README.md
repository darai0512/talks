- [NodeFest(学園祭) 2018 Session](https://nodefest.jp/2018/schedule.html#conference-2-3): [Slides](https://darai0512.github.io/nodefest2018/#/)
- [NodeSchool#25 20170424](https://nodejs.connpass.com/event/54749/presentation/): [Slides](https://darai0512.github.io/talks/nodeschool_20170424/)
- [Gotanda.js#9 20171006](https://gotandajs.connpass.com/event/66262/): [Slides](https://darai0512.github.io/talks/gotandajs_20171006/)
- Meguro.es#17 20181004: [Slides](https://darai0512.github.io/talks/meguroes_20181004/)

## Offline

use apache(mac) and access: http://localhost/~darai0512/talks/<dirname>/

setup apache ref: https://qiita.com/darai0512/items/d88662773a070b1bc750#apache

## PDF

https://gist.github.com/uupaa/7744760

- slide URL + `?print-pdf`
- CMD + P & output pdf

# How to make this repository

```
$npm i --production
```

make the following difference to use emoji

```
$vi node_modules/reveal.js/plugin/markdown/markdown.js
-				var markdown = getMarkdownFromSlide( section );
+				var markdown = getMarkdownFromSlide( section ).replace(/[\s]+:([a-z_]+):/g, '<i class="em em-$1" style="font-size: 0.9em"></i>');

 				section.innerHTML = marked( markdown );
```

copy index.html, and edit `README.md`!

```
$cp -r init slide
$vi slide/README.md
your presentation here!
```

option: edit [reveal.js theme](https://revealjs.com/#/themes)

```
$vi slide/index.html
<link rel="stylesheet" href="css/theme/XXX.css" id="theme">
```

# Other slide frameworks
## [impress.js](https://github.com/tsucchi/ruby-markdown2impress)

exec the following command if you don't have Gemfile.lock file.

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

## md2gslides

```
$npm i
$npm run googleslide -- path/to/file.md
# enter your code => created your slides & token
$ls -l ~/.credentials/md2gslides.json
```

but now, it is inconvenient...

- Not available strikethrough(取り消し線)
- Error message is only 1 pattern, so unkind...
- Many making time due to Authentication
  - over 20 seconds even if only 2,3 pages...
- Not available multiple hyperlinks every one line
- Error if including a hyperlink in the beginning of unorder list
