---
id: <% tp.date.now("YYYY") %>R<% tp.date.now("HHmmss") %>   # R = Relation / Combo
title: <% tp.file.title %>
tags:
  - zettelkasten
  - relation-note      # 统一标签，后面可以用 Dataview 一键拉出所有关系卡
  - combo              # 可选：combo / relation / hub / bridge 随便你喜欢
created: <% tp.date.now("YYYY-MM-DD HH:mm") %>
modified: <% tp.date.now("YYYY-MM-DD HH:mm") %>
aliases: []                  # 可选：给这张关系卡起个别名，方便搜索
---

# <% tp.file.title %>

最新更新：`= dateformat(date(today), "yyyy-MM-dd")`

**涉及核心卡片**：
- [[]]
- [[]]

---

## 触发场景（一句话说清「什么时候会想到这几个东西一起用」）

（写最具体的使用场景，越具体这张卡越值钱）

## 关系本质（用自己的话提炼它们之间的「化学反应」）

（这就是这张卡的灵魂！写出为什么 1+1>2，甚至 1+1=10）

## 结构图（强烈推荐，直接用 PlantUML 画出来，视觉冲击力拉满）

```plantuml-svg
@startuml
skinparam shadowing false
skinparam backgroundColor #FFF

class 单例模式 {
  +getInstance()
}

class 策略模式 {
  +execute()
}

单例模式 --> 策略模式 : 持有并切换
note right of 单例模式
  全局唯一上下文
  保证策略切换安全
end note

@enduml