---
id: 2025A105646
title: Bugs的术语
tags:
  - zettelkasten
  - permanent-note
  - 软件工程
created: 2025-12-09 10:56
aliases: []
---


# Bugs的术语

最新更新：`= dateformat(date(today), "yyyy-MM-dd")`

---

## 核心内容

- human mistake、error
- fault
- failure

## 正文

- human mistake、error：不是软件本身的问题，是人的行为导致的。由于疏忽、误解需求、逻辑错误等因素造成的出错。可以通过代码审查、自动化工具减少
- fault：human mistake导致的代码或产品中的实际缺陷。是human mistake的具体结果。客观存在于软件中，是可修复的代码级问题
- failure：是fault被激活的最终表现，直接影响用户体验。可以通过日志、监控或用户反馈来检测，但修复需要追溯到fault于human mistake

## 相关链接
[[软件的定义]]

## References


