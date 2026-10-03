# 问题生命周期：7 阶段循环

> 问题不是线性的。它是一个循环，每次循环都扩大系统"提前发现"的能力。

---

## 总览

```
现实 ──→ ① DISCOVER ──→ ② TRIAGE ──→ ③ DIAGNOSE ──→ ④ TRANSFORM
                                              ↑                      │
                                              │                      ↓
知识库 ←── ⑦ LEARN ←── ⑥ VERIFY/CHALLENGE ←── ⑤ SOLVE ←────────────┘
```

| 阶段 | 核心问题 | 注意力 | 关键动作 |
|------|---------|--------|---------|
| **① Discover** | 哪里出现了与预期不一致的东西？ | 感知 | 观察现象，生成 Problem Candidate |
| **② Triage** | 这个问题值得现在解决吗？ | 判断 | 初筛：Impact × Urgency × Scope × Uncertainty |
| **③ Diagnose** | 真正的问题是什么？ | **最高** | 5Why / 鱼骨图 / 故障树 → Problem Tree |
| **④ Transform** | 还能怎么问？ | 高 | 8 种转化模式 → Solvable Problem |
| **⑤ Solve** | 怎么实现？ | 低 | 交给 AI / 工具 / 团队执行 |
| **⑥ Verify/Challenge** | 真的解决了吗？哪里还可能失败？ | 中高 | 验证 + 攻击解空间 → Evidence |
| **⑦ Learn** | 下次如何更早发现？ | 中 | 沉淀为 Risk Tree + Knowledge Base → 回到 Discover |

---

## 关键规则

### 规则 1：Triage 两次

```
第一次 Triage（初筛）          第二次 Triage（Re-Triage）
    ↓                              ↑
"看起来不严重"              →   5Why 定位后
    ↓                              ↑
5Why                         →   "实际上影响了核心交易链路"
    ↓                              ↑
Diagnose                      →   重要度上升 → 重新评估
```

**为什么？** 因为在定位之前，你对问题的了解是不完整的。初筛只是基于表象的判断，定位后才能做出真正的决策。

### 规则 2：Risk Tree 贯穿全程

不是在问题解决后才构建风险树，而是在**每个阶段**都问：

> "什么可能让这一步失败？"

| 阶段 | 风险问题 |
|------|---------|
| Discover | 这是真信号还是噪音？ |
| Triage | 会不会遗漏了更重要的问题？ |
| Diagnose | 根因分析有没有偏差？ |
| Transform | 转化后的问题还是原来的问题吗？ |
| Solve | 执行过程中会不会引入新问题？ |
| Verify | 验证方法有没有盲区？ |
| Learn | 沉淀的知识会不会过时？ |

### 规则 3：Human Gate

AI 停在 **Transform**，人类审核后才进入 **Solve**。

```
Human:  Discover → Triage → Diagnose → Transform ──┐
                                                     ├── 协作边界
AI:     ────────────────────────────────→ Solve ──┘
```

不是每个 Task 都监督，而是在阶段边界做关键判断。

---

## 循环的意义

```
第 1 次循环：解决了一个问题
第 2 次循环：发现了一类问题
第 3 次循环：预防了一类问题
第 N 次循环：系统具有了"提前发现"的组织学习能力
```

每次 Learn 阶段沉淀的 Risk Pattern，都会在下一次 Discover 阶段被匹配，从而**提前发现问题**。

这就是闭环的价值：

> **不是解决得更快，而是发现得更早。**
