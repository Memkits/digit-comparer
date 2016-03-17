
# digit-comparer

Small app to display digits in bar chart.

Demo http://frp.im/Memkits/digit-comparer/resources/public/

> It's a prototype, still WIP.

## Build

```bash
lein cirru-sepal # need to create folder manually, my fault
lein html-entry
lein cljsbuild once web-prod
# visit resources/public/index.html
```

## Develop

```bash
lein cirru-sepal # need to create folder manually, my fault
lein html-entry
lein cirru-sepal watch
rlwrap lein figwheel web-dev
# visit resources/public/index.html
```

## License

Copyright © 2016 jiyinyiyong

Distributed under the Eclipse Public License either version 1.0 or (at
your option) any later version.
