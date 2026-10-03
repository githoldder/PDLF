# Risk: 查询模式导致索引失效

## 当前评估
- severity: 8（核心交易链路，直接影响收入）
- probability: 6（开发常见错误，代码审查可能漏掉）
- unknown: 4（已知模式，有成熟检测方案）
- RPN: 192（高优先级，需 mitigation）

## 缓解状态
- [x] Prevent: ORM 层拦截所有函数包裹索引列的查询（lint 规则，2026-10-01 部署）
- [ ] Detect: CI 阶段自动 EXPLAIN 所有新增查询，标记全表扫描（预计 2026-10-08）
- [ ] Recover: 快速回滚手册 + 数据库读写分离降级（待编写）

## 历史触发记录
- 2026-10-01: /api/v1/orders 接口，影响 2 小时，P99 从 120ms → 3200ms
- 触发查询: `WHERE DATE(created_at) = ?`
- 根因: 新功能复用旧查询模式，测试环境未触发

## 相关风险模式
- 类似模式: `UPPER(email)`, `CONCAT(first_name, last_name)` 等函数包裹索引列
- 监控: 已添加 SQL 慢查询告警，阈值 500ms
