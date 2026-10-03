# Risk: 新功能查询模式引发性能问题

## Meta
- created: 2026-10-01
- owner: caolei
- status: open

## Discover
- 场景: 新功能开发中可能引入类似 `DATE(column)` 的查询
- 触发: 开发者不熟悉索引失效模式，ORM 自动生成查询

## Assess
- severity: 7（影响用户体验，非核心链路）
- probability: 7（常见开发错误，团队新人多）
- unknown: 5（部分 ORM 行为不可预测）
- RPN: 245（高优先级）

## Mitigate
- Prevent: Code Review 检查清单增加"索引列函数包裹"项
- Detect: 预发布环境自动跑 EXPLAIN，标记全表扫描
- Recover: 查询级别熔断，超时自动降级
- 选择: Prevent + Detect 并行

## Solve
- 任务: 更新 CR 检查清单 + 预发布 EXPLAIN 扫描
- 验收: 连续 2 个 Sprint 无新增索引失效问题
- 状态: ⏳ 待开始
- 截止日期: 2026-10-15
