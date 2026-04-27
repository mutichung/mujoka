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
views:
  - type: table
    name: Table
    order:
      - title
      - created
      - tags
    sort:
      - property: created
        direction: DESC
    indentProperties: false

```
