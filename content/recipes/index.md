---
title: 食譜
created: 2026-01-01
icon: LiCookingPot
---

這個分類蒐集了過去我們（主要是 Muti XD）做過的一些料理

```base
filters:
  and:
    - file.folder == "recipes"
    - file.basename != "index"
    - file.basename != "All"
views:
  - type: cards
    name: 卡片
    order:
      - tags
      - ingredients
    image: note.cover
    imageAspectRatio: 1.0
  - type: table
    name: 一覽
    order:
      - title
      - tags
      - ingredients
    sort:
      - property: ingredients
        direction: ASC
      - property: tags
        direction: ASC
```
