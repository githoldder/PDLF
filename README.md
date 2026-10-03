# PDLF — Problem-Driven Lifecycle Framework

> **优秀工程师不是只会解决问题，而是会控制问题空间。**
>
> **Attention Follows the Problem.**

---

## 一个原则

**注意力跟着问题走。**

不是 Every Task。人的注意力不应该平均分配给每一个任务，而应该跟随问题、风险和关键判断节点移动。

[详细 → `100-principles/110-attention-follows-problem.md`](100-principles/110-attention-follows-problem.md)

---

## 两颗树

| | 问题发生了 | 问题还没发生 |
|---|-----------|------------|
| **树** | **Problem Tree** | **Risk Tree** |
| **核心** | 找到真正的因果节点 | 主动寻找可能失败的路径 |
| **目的** | 提高解决问题的效率 | 避免问题发生的可能 |
| **方法** | 5Why、鱼骨图、故障树 | FMEA、边界测试、对抗思维 |

```
Problem Tree              Risk Tree
"真正的问题是什么？"      "还可能在哪里失败？"
      ↓                         ↓
  效率提升                 成本降低 + 预防
```

[详细 → `200-structure/230-one-principle-two-trees.md`](200-structure/230-one-principle-two-trees.md)

---

## 三个方法

### ① 5Why — 构建问题，找到真正的因果节点

> **问题发生了：层层追问，直到找到可以永久解决的因果节点。**

不是问 5 次，而是问到**可以行动为止**。

[详细 → `300-methods/320-fmea-guide.md`](300-methods/320-fmea-guide.md)

### ② 问题转化 — 把难题变成简单题

> **问题很难：改变表达方式、边界或约束，把它变成更适合求解的问题。**

8 种转化模式：约束松弛、降维、类比映射、固定常数、最坏界、模拟替代、逆问题、Oracle 归约。

[详细 → `300-methods/310-transformation-patterns.md`](300-methods/310-transformation-patterns.md)

### ③ FMEA — 构建风险，主动寻找失败路径

> **问题还没发生：在失败发生之前，构建一个潜在问题树。**

Severity × Probability × Unknown = RPN。高 RPN 优先处理。

[详细 → `300-methods/320-fmea-guide.md`](300-methods/320-fmea-guide.md)

---

## 四个效果

| 效果 | 含义 | 对应方法 |
|------|------|---------|
| **更短时间** | 减少寻找真正问题的时间 | Problem Tree + 5Why |
| **更低成本** | 降低解决问题的难度 | 问题转化 |
| **可视化** | 问题构建解决过程存档留痕 | Markdown 文件系统 |
| **高效** | 发现并规避可能再次遇到的问题 | Risk Tree + FMEA |

```
更短时间  +  更低成本  +  可视化  +  高效
   ↑            ↑           ↑          ↑
Problem     Transform    文件系统    Risk
  Tree       问题转化    即树结构    Tree
```

---

## 问题生命周期（7 阶段循环）

```
现实 ──→ ① DISCOVER ──→ ② TRIAGE ──→ ③ DIAGNOSE ──→ ④ TRANSFORM
                                              ↑                      │
                                              │                      ↓
知识库 ←── ⑦ LEARN ←── ⑥ VERIFY/CHALLENGE ←── ⑤ SOLVE ←────────────┘
```

| 阶段 | 核心问题 | 注意力 | 关键动作 |
|------|---------|--------|---------|
| **① Discover** | 哪里不对？ | 感知 | 观察现象，生成候选问题 |
| **② Triage** | 值得解决吗？ | 判断 | 初筛：Impact × Urgency × Scope × Uncertainty |
| **③ Diagnose** | 真正的问题是什么？ | **最高** | 5Why → Problem Tree |
| **④ Transform** | 还能怎么问？ | 高 | 8 种转化 → 可解问题 |
| **⑤ Solve** | 怎么实现？ | 低 | 交给 AI / 工具执行 |
| **⑥ Verify** | 真的解决了吗？ | 中高 | 验证 + 攻击解空间 |
| **⑦ Learn** | 下次如何更早发现？ | 中 | 沉淀 Risk Tree → 回到 Discover |

**关键规则**: Triage 两次 · Risk Tree 贯穿全程 · Human Gate（AI 停在 Transform）

[详细 → `200-structure/210-lifecycle-7-stages.md`](200-structure/210-lifecycle-7-stages.md)

---

## 问题状态层级

| 层级 | 状态 | 示例 |
|------|------|------|
| **L0** 信号 | "CPU 90%" — 只是现象 | 观察 |
| **L1** 候选 | "查询慢导致超时" — 需要确认 | 判断是否值得处理 |
| **L2** 关键 | "索引失效导致全表扫描" — 可行动 | 定位 + 转化 + 解决 |
| **L3** 风险 | "ORM 自动生成函数查询是系统性模式" — 影响未来 | 验证 + 预防 + 沉淀 |

> **问题的重要性不是由"它现在看起来多严重"决定，而是由定位后的因果结构决定。**

[详细 → `200-structure/220-level-l0-to-l3.md`](200-structure/220-level-l0-to-l3.md)

---

## 四层知识结构

```
100-principles/     ← L1 · 原理层：核心原则、认知转向
200-structure/      ← L2 · 结构层：7阶段循环、状态层级
300-methods/        ← L3 · 方法层：5Why、FMEA、转化模式、检查清单
400-examples/       ← L4 · 经验层：具体案例、完整归档
```

**设计策略**：越顶层越图像化（传播），越底层越文档化（实践）。

---

## 快速开始

**人类路径**：`100-principles/` → `200-structure/` → `300-methods/` → `400-examples/`

**Agent 路径**：读取问题 → 匹配 `200-structure/` 阶段 → 调用 `300-methods/` 工具 → 参考 `400-examples/` 对标

---

## 示例

| 示例 | 路径 | 说明 |
|------|------|------|
| 调试慢查询 | [`400-examples/410-debug-slow-api/`](400-examples/410-debug-slow-api/) | 完整 7 阶段，20 分钟定位 |
| 考研规划 | [`400-examples/420-kaoyan-planning/`](400-examples/420-kaoyan-planning/) | 非技术场景，识别焦虑根因 |
| 风险预防 | [`400-examples/430-query-pattern-review/`](400-examples/430-query-pattern-review/) | 独立风险分析，RPN=192 |

---

## 三条铁律

1. **Community First** — 解决问题先搜社区
2. **Learn Everything** — 完整记录 diagnose → solve → prevent，沉淀为知识
3. **Human Gate** — AI 停在 Transform，人类审核后才进入 Solve

---

## 工程师等级

| 等级 | 能力 | 对应阶段 |
|------|------|---------|
| **初级** | 解决发生的问题 | Solve |
| **中级** | 找到真正的问题再解决 | Diagnose + Solve |
| **高级** | 改变问题的表示，使问题更容易解决 | Transform + Solve |
| **更高阶** | 在问题发生之前识别它 | Discover + Learn（闭环） |

> **AI 越强，执行越便宜；人类的价值越集中在定义问题、转化问题、预见风险。**
>
> PDLF 的目的：**把注意力重新还给人类。**

---

## License

MIT — 自由使用、修改、传播。如果它帮你省下了时间和注意力，这就是最好的回报。
