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
views:
  - type: table
    name: Table
    order:
      - title
      - file.folder
      - created
      - tags
    sort:
      - property: created
        direction: DESC
    indentProperties: false

```
