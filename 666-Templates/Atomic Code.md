---
id: <% tp.date.now("YYYY") %>A<% tp.date.now("HHmmss") %>
title: <% tp.file.title %>
tags:
  - zettelkasten
  - permanent-note
  - code-snippet                # 统一标签，后面Dataview一键拉出所有纯代码卡
created: <% tp.date.now("YYYY-MM-DD HH:mm") %>
aliases: []
---

# <% tp.file.title %>

最新更新：`= dateformat(date(today), "yyyy-MM-dd")`

**语言**：Java

**一句话描述**：

```java
public class App {
	public static void main(String[] args) {
	}
}
```

```plantuml-svg
@startuml
testdot
@enduml
```

## References
