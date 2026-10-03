# 版本对比分析：初版 Toolkit vs 现行 PDLF

> 分析日期: 2026-10-02
> 分析对象: 桌面 `问题工程.png`（初版） vs `README.md`（现行版）

---

## 一、初版图片内容还原

### 01 Principle — 核心原则
- **Attention Follows the Problem**（注意力追随问题）
- 人的注意力不应该平均分配给每一个 Task，而应该跟随问题、风险和关键判断节点移动
- Human → Problem Space / Risk Space / Decision Points（不是 Every Task）

### 02 Two Trees — 核心模型
- **Problem Tree**（已发生的问题空间）
  - What（表象）→ Where（关注点）→ Why（根因）→ How Else（问题转化/横向简化）
  - 5 Why = 纵向深入
- **Risk Tree**（未发生的风险空间）
  - What If（如果失败会怎样？）
  - Failure Mode / Unknown Area / High-impact Path / Hidden Dependency
  - FMEA + V-Model + Risk-Based Testing / Mutation / Adversarial Thinking
- Problem Space = Known Problems + Potential Failures

### 03 Core Actions — 三种核心动作
1. **Construct** 构建问题：What → Where → Why（表象→关注点→根因）
2. **Transform** 转化问题：How Else（改变表达方式、边界、约束或路径）Complex → Simple → Task
3. **Prevent** 构建风险：What If（主动寻找失败路径）

### 04 AI Execution — 执行机制
- Problem Space → What → Where → How Else → Task（可执行任务）
- ≤ 2 min ? → Human Review → Agent Execute
- Human: Problem / Risk / Decision | AI: Task / Execution

### 05 Engineering — 工程方法
- Risk Tree = V-Model（工程化实现）
- Risk-Based Testing：风险优先级 = Likelihood × Impact × Uncertainty

### 06 Lifecycle — 生命周期闭环
- New Problem → Problem → Build → Test → Deploy → Observe →（持续迭代）
- "问题树不是阶段文档，而是持续状态"

### 07 Toolkit Files — 文件结构
- problem.md / risk.md / decisions.md / evidence/ / references/
- Human-readable / AI-readable / Git-trackable

### 08 Two Rules — 工程规则
1. Community First（Spatial Locality）
2. Archive the Solution（Temporal Locality）

---

## 二、现行 README 内容概要

### 核心转向
- 从 "工具" → "决策框架"
- 问题有自己的生命周期

### 7 阶段循环
Discover → Triage → Diagnose → Transform → Solve → Verify/Challenge → Learn

### 问题状态层级
L0(信号) → L1(候选) → L2(关键问题) → L3(系统性风险)

### 三问三树三注意力
- WHY? / HOW ELSE? / WHAT IF?
- Problem Tree / Solution Tree / Risk Tree
- 过去(Observation) / 现在(Resolution) / 未来(Prevention)

### 8 种转化模式 + 工程师等级 + 三条铁律

---

## 三、核心差异分析

### 维度 1：定位 — Toolkit vs Framework

| 初版 | 现行版 |
|------|--------|
| "Problem Engineering Toolkit" — 工具包 | "Problem-Driven Lifecycle Framework" — 框架 |
| 可直接上手的工程方法集合 | 问题生命周期的元理论 |
| 偏"怎么做" | 偏"为什么这么做" |

**关键差异**：初版把自己当作一个可以直接拿来用的工具箱，现行版把自己当作一个指导思考的元框架。

---

### 维度 2：核心结构 — 3动作 vs 7阶段

| 初版 | 现行版 |
|------|--------|
| Construct / Transform / Prevent（3个动词） | Discover / Triage / Diagnose / Transform / Solve / Verify / Learn（7个名词） |
| 以"动作"为中心 | 以"阶段"为中心 |
| 简洁，但缺少"判断"和"验证"的显式表达 | 完整，但术语数量翻倍 |

**关键洞察**：现行版把初版隐含的"判断"（Triage）和"验证"（Verify）显性化了，这是重要的改进。但 7 个术语是否过多？

---

### 维度 3：生命周期表达 — 工程闭环 vs 认知循环

| 初版 | 现行版 |
|------|--------|
| New Problem → Build → Test → Deploy → Observe | Discover → Triage → Diagnose → Transform → Solve → Verify → Learn |
| 强调"问题树是持续状态" | 强调"决策框架" |
| 与软件工程实践紧密耦合 | 与认知过程紧密耦合 |

**关键洞察**：初版的生命周期是"工程视角"（怎么做），现行版是"认知视角"（怎么想）。这是根本性的视角转换。

---

### 维度 4：AI 协作 — 时间阈值 vs 阶段边界

| 初版 | 现行版 |
|------|--------|
| ≤2min? → Human Review → Agent Execute | Human Gate at Transform |
| 以"时间"为判断标准 | 以"阶段"为判断标准 |
| 明确的可执行性阈值 | 模糊但更符合实际决策流程 |

**关键洞察**：初版的 ≤2min 规则非常具体但过于简化（有些问题 2 分钟根本不够判断）。现行版以 Transform→Solve 的边界作为 Human Gate 更合理，但失去了"可执行性"的具体判断标准。

---

### 维度 5：工程方法 — 内嵌 vs 外置

| 初版 | 现行版 |
|------|--------|
| V-Model / FMEA / Risk-Based Testing 内嵌在主图 | V-Model / FMEA 移入 docs/ |
| 信息密度极高，一张图包含全部 | 主框架精简，工程方法作为扩展 |
| 适合"看一眼就懂" | 适合"按图索骥" |

**关键洞察**：这是传播性和实用性的核心矛盾。内嵌传播力强但臃肿，外置简洁但割裂。

---

### 维度 6：术语体系 — 5问句 vs 7阶段+3问句

| 初版 | 现行版 |
|------|--------|
| What / Where / Why / How Else / What If | Discover / Triage / Diagnose / Transform / Solve / Verify / Learn + Why? / How Else? / What If? |
| 5 个问句，统一在"问问题"的语境下 | 7 个阶段名词 + 3 个问句 |
| 术语少，记忆成本低 | 术语多，但表达更精确 |

**关键洞察**：初版用"问句"作为术语，天然具有引导思考的作用。现行版用"阶段名词"，更适合描述流程，但记忆和传播成本更高。

---

### 维度 7：新增内容（现行版独有）

- **L0-L3 问题状态层级**：初版没有这个抽象。这是非常重要的补充，解决了"异常≠问题"的核心认知。
- **Solution Tree**：初版只有 Problem Tree 和 Risk Tree。Solution Tree 的引入是合理的，但增加了复杂度。
- **8 种转化模式**：初版只有"横向简化"的概念，现行版具体化为 8 种模式。
- **工程师等级**：初版没有这个抽象。
- **Triage 两次 / Re-Triage**：这是现行版最有价值的改进之一。

---

### 维度 8：传播形态 — 海报式 vs 文档式

| 初版 | 现行版 |
|------|--------|
| 一张图讲清全部 | 需要阅读完整文档 |
| 适合社交传播、快速理解 | 适合深度实践、按图索骥 |
| 信息密度高 | 信息密度低 |
| "看完这张图我就懂了" | "看完 README 我知道怎么做了" |

---

## 四、关键矛盾点

### 矛盾 1：传播性 vs 实用性
- 初版传播力强（一张图），但落地时需要补充很多细节
- 现行版落地性强（结构化文档），但传播时无法"一张图讲清"

### 矛盾 2：抽象度 — 太具体 vs 太抽象
- 初版太具体（V-Model、FMEA、≤2min），对非软件工程场景不适用
- 现行版太抽象（7阶段循环、L0-L3），对初学者不够友好

### 矛盾 3：术语数量 — 太少 vs 太多
- 初版 3 个动作 + 5 个问句 = 8 个核心概念
- 现行版 7 个阶段 + 3 个问句 + 4 个层级 + 3 棵树 = 17 个核心概念
- 人类工作记忆容量约 4±1 个组块

### 矛盾 4：工程方法 — 内嵌割裂 vs 外置遗忘
- 内嵌：与核心框架一体，不会遗忘，但信息过载
- 外置：主框架简洁，但工程方法容易被忽略

---

## 五、各自不可替代的优势

### 初版不可替代的优势
1. **海报式传播**：一张图可以发朋友圈、做演讲背景、印成海报
2. **What/Where/Why/How Else/What If 五问句**：天然引导思考，不需要记忆阶段名词
3. **≤2min 规则**：具体的、可操作的 AI 协作判断标准
4. **工程方法内嵌**：V-Model 和 FMEA 与核心框架天然关联

### 现行版不可替代的优势
1. **Triage / Re-Triage**：解决了"重要度不是一次性判断"的核心问题
2. **L0-L3 状态层级**：解决了"异常≠问题"的认知盲区
3. **Verify/Challenge 独立阶段**：解决了"解决问题≠问题已证明解决"
4. **Solution Tree**：填补了"准备如何解决"的表达空白
5. **工程师等级**：提供了清晰的能力成长路径

---

## 六、收敛方向思考

理想状态可能是：**初版的传播形态 + 现行版的理论深度**

即：
- 对外传播时用"一张图"（保留初版的海报式优势）
- 对内实践时用"结构化文档"（保留现行版的深度优势）
- 术语体系取交集：保留最有价值的概念，砍掉传播负担
- 工程方法分层：主图只放核心，docs 放扩展
