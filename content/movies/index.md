---
title: 電影
created: 2026-01-01
icon: LiVideo
---

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
    groupBy:
      property: released
      direction: DESC
    image: note.cover
    imageFit: contain
    imageAspectRatio: 0.65
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
