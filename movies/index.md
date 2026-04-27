---
title: 電影
created: 2026-01-01
icon: LiVideo
---

這是我們的電影海報牆！也可以切換到**一覽**來看看我們的評分XD

```base
filters:
  and:
    - file.folder == "movies"
    - file.basename != "index"
    - file.basename != "All"
formulas:
  avg: "[joanna, muti].filter(value > 0).mean()"
views:
  - type: cards
    name: 海報牆
    sort:
      - property: created
        direction: DESC
    image: note.cover
    imageFit: contain
    imageAspectRatio: 0.7
  - type: table
    name: 一覽
    order:
      - title
      - released
      - joanna
      - muti
      - formula.avg
    sort:
      - property: released
        direction: DESC
      - property: title
        direction: DESC

```
