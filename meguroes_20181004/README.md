## Diagnose your Node.js app(intro)

2018/10/04 @meguro.es

by darai0512

---

<!-- .slide: data-background="img/nodesummit2018.JPG"-->
<!-- .slide: data-background-opacity="0.8"-->
## Agenda

- Node Summit 2018 Report
  - abstruct
  - summary
  - tips
- Diagnose your Node.js app (intro)
  - Diagnostics?
  - Examples
  - nearForm Product

---

<!-- .slide: data-background="img/nodesummit.png"-->
<!-- .slide: data-background-opacity="0.7"-->
# [Node Summit 2018](http://www.nodesummit.com/)

------

<!-- .slide: data-background="img/venue.jpeg"-->
<!-- .slide: data-background-opacity="0.8"-->
### MISSION BAY CONFERENCE CENTER, SAN FRANCISCO, CALIFORNIA

------

<!-- .slide: data-background="img/meal.JPG"-->
<!-- .slide: data-background-opacity="0.8"-->
### Ticket fee: $660

- 3 days session
  - Training Days: additional
- Breakfast, Lunch and Networking included
  - bread, cookie, fruit, coke, ice cream... :scream:

Note:
高いと思う。物価も高いから毎日Uber eats

------

<!-- .slide: data-background="img/session.JPG"-->
<!-- .slide: data-background-opacity="0.5"-->

|category|count|
|---|---|
|Cloud(k8s, Lambda, microservice)|10|
|Node core API, v8, libuv|9|
|**Diagnostics**|7|
|Security|5|
|Community, Team building|5|
|Enterprise|5|
|DevOps, Test|4|
|Ecma Script(new feature, etc), Framework, AI, voice|16|

Note:
自社製品紹介も多い

------

<!-- .slide: data-background="img/session.JPG"-->
<!-- .slide: data-background-opacity="0.5"-->

#### Tips

- 1000人以上の出席者(うち日本人6名)
- speakerにcommitterが多い
  - [PR](https://github.com/nodejs/node/pull/20359)をレビューくれた[Matteo Collina](https://github.com/mcollina)に直接お礼!
- 英語はslideがあるのでどうにかなる & **Take a Risk**
  - PANEL DISCUSSIONは厳しい
- サンフランシスコの物価は高い :innocent:
  - 移動はUber/食事はUber eats
  - カニとガーリックヌードル@[Crustacean](https://allabout.co.jp/gm/gc/436658/)

---

<!-- .slide: data-background="img/nodejs_diagnostics.png"-->
<!-- .slide: data-background-opacity="0.3"-->
<!-- .slide: style="font-size: 42px; text-align: left;"-->
## Diagnostics

- **Monitoring**: Security, Performance, Service Level
- **Profiling**: V8 CPU/Heap Profiler, ab
- **Tracing**: stack-trace, AsyncHooks, OS, VM

Note:
Tracing: a past mark to follow the footprints of, 以前発生した出来事の痕跡を追う
-> プロセス内で起きたことの記録
Profiling: to give a brief infomation, 端的な指標
Monitoring: to watch, check continuously, 継続的な確認・監視

------

<!-- .slide: data-background="img/nodejs_diagnostics.png"-->
<!-- .slide: data-background-opacity="0.3"-->
#### どうして今？

- Node v10で機能強化
  - [`Async Hooks`](https://nodejs.org/dist/latest-v8.x/docs/api/async_hooks.html)
  - [`PERF_HOOKS`](https://nodejs.org/dist/latest-v8.x/docs/api/perf_hooks.html)
  - [TRACE_EVENTS](https://nodejs.org/dist/latest-v8.x/docs/api/tracing.html)
- [Diagnostics WG](https://github.com/nodejs/diagnostics)
  - Tracing: the platform independent V8 Trace Events Format

------

<!-- .slide: data-background="img/eventloop.jpeg"-->
<!-- .slide: data-background-opacity="0.3"-->
## 初学者の悩み

- 同期処理の方が慣れてるからXXSyncを使ってるけど思ったよりパフォーマンスが :cry:
  - どう調べる?どう解決?
- CPUヘビーな処理はどうすればいい？
  - どう調べる?どう解決?
- 非同期処理のイベントキューの数を検知したい
- 非同期処理が処理されるタイミングを理解したい
  - どう調べる?どう解決?

------

<!-- .slide: data-background="img/eventloop.jpeg"-->
<!-- .slide: data-background-opacity="0.3"-->
## 初学者の悩み

- 同期処理の方が慣れてるからXXSyncを使ってるけど思ったよりパフォーマンスが :cry:
  - [Easy profiling for Node.js Applications](https://nodejs.org/en/docs/guides/simple-profiling/)
- CPUヘビーな処理はどうすればいい？
  - `--prof` or `--prof-processor`, スループットを出したいならCluster/pm2を検討
- 非同期処理のイベントキューの数を検知したい
- 非同期処理が処理されるタイミングを理解したい
  - ASYNC_HOOKS, process._getActiveRequests().length, [EventLoop](https://github.com/nodejs/node/blob/v9.x/deps/uv/src/unix/core.c#L348-L397)を勉強、但し基本的に再現性はないので順番に依存しないよう設計

Note:
ASYNC_HOOKS
- A handle is a long-lived thing that has async activity over time.
- A request is a short-lived request to do one asynchronous thing.

------

### Runtime performance

- productionで途中からProfiling用3rd party ライブラリを入れるのは厳しい
- V8のコマンドラインオプションとして用意されている
  - `--perf-basic-prof`
  - `--perf-basic-prof-only-functions`
- memory leakなどheapのsnapshot: `--inspect` + Chrome DevTools

------

### Runtime crashes

- 原因究明よりすぐに復旧が必要
- 再現が難しいことが多い
- [post-mortem](https://github.com/nodejs/post-mortem): わざとcrashさせて指標を得る手法
  - `--abort-on-uncaught-exception`

Note:
lldbなど
Out of Memoryや Uncaught exceptions発生時にコアダンプ
https://yosuke-furukawa.hatenablog.com/entry/2016/07/12/103734
https://github.com/nodejs/node/issues/21988

------

## Node Clinic Demo

Note:
[flamegraph](https://nodejs.org/en/blog/uncategorized/profiling-node-js/)
process.memoryUsage().heapUsed

---

<!-- .slide: data-background="img/nodefest2018.png"-->
<!-- .slide: data-background-opacity="0.3"-->
## Node学園祭2018

- 会場: ヤフー株式会社 紀尾井町オフィス
- 日程: 11/23 - 24
- speaker
  - Anna Henningsen: [Node.js: The Road to Workers](https://nodejs.org/dist/latest-v10.x/docs/api/worker_threads.html)
  - Fedor Indutny: [Secret talk about vulnerability in Node](https://darksi.de/12.hashwick-v8-vulnerability/)
  - darai0512 :tada:: Diagnose your Node.js app

Note:
- Anna
  - ドイツ,iojs
  - Workers, and threading support in general, have been one of the most frequently requested features for Node.js over the last years. Finally, the finishing line is in sight and we’re pretty excited to have experimental support available! This talk will tell you everything around the API, features, use cases & alternatives, our roadmap, and the technical and social challenges that we had to overcome to make it happen!
  - CPUヘビーな処理に効果期待、SharedArrayBufferなどで共有可能
- Fedor
  - paypal, 当時高校生
  - I'd like to share the methodology of discovering the vulnerability that isn't yet fixed, but was recently reported
  - HashDoS: Gがなかなか直さないから公開した, https://yosuke-furukawa.hatenablog.com/entry/2017/07/15/104616

------

<!-- .slide: data-background="img/nodefest2018.png"-->
<!-- .slide: data-background-opacity="0.3"-->
## Continue on the Node学園祭2018
