---
title: 最近
---

```base
filters:
  and:
    - file.ext == "md"
    - file.hasProperty("title")
    - file.hasProperty("created")
    - file.basename != "index"
    - '!file.folder.startsWith("templates")'
formulas:
  Category: file.folder
  category: |-
    if(file.inFolder("recipes"), "食譜",
    if(file.inFolder("movies"), "電影",
    if(file.inFolder("travel"), "旅行",
    if(file.inFolder("blog"), "日常", file.folder
    ))))
views:
  - type: table
    name: Table
    order:
      - title
      - formula.category
      - created
      - tags
    sort:
      - property: created
        direction: DESC
    indentProperties: false

```
