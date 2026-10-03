# PDLF Scaffold Skill

> **一行命令，初始化你的问题驱动工作流。**

---

## 安装

```bash
git clone https://github.com/githoldder/PDLF.git ~/.pdlf
alias pdlf="bash ~/.pdlf/skill/scripts/pdlf.sh"
```

添加到 `~/.bashrc` 或 `~/.zshrc`：

```bash
echo 'alias pdlf="bash ~/.pdlf/skill/scripts/pdlf.sh"' >> ~/.zshrc
source ~/.zshrc
```

---

## 使用

### 创建新问题

```bash
pdlf new "API响应变慢"
# 生成：pdlf-YYYYMMDD-api-response-slow/
#   ├── problem.md
#   ├── risk.md
#   └── references/
```

### 指定场景创建

```bash
pdlf new "考研复习焦虑" --scene learning
pdlf new "项目风险评估" --scene project
pdlf new "系统故障排查" --scene tech
pdlf new "AI协作问题" --scene ai
```

### 列出检查清单

```bash
pdlf checklist triage      # Triage 检查清单
pdlf checklist diagnose    # Diagnose 检查清单
pdlf checklist transform   # Transform 检查清单
pdlf checklist verify      # Verify 检查清单
pdlf checklist learn       # Learn 检查清单
```

### 快速查看框架

```bash
pdlf info                  # 显示 PDLF 核心框架
pdlf info --one-pager      # 显示 One-Pager 图
pdlf info --stages         # 显示 7 阶段循环
```

### 社区搜索辅助

```bash
pdlf search "MySQL 索引失效" --so     # Stack Overflow
pdlf search "MySQL 索引失效" --github  # GitHub Issues
pdlf search "MySQL 索引失效" --all     # 全部平台
```

---

## 命令速查

| 命令 | 作用 |
|------|------|
| `pdlf new <name>` | 创建新问题目录 |
| `pdlf new <name> --scene <type>` | 按场景创建 |
| `pdlf checklist <stage>` | 显示检查清单 |
| `pdlf info` | 显示框架信息 |
| `pdlf search <query>` | 社区搜索辅助 |
| `pdlf version` | 显示版本 |

---

## 场景模板

| 场景 | 说明 | 适用人群 |
|------|------|---------|
| `tech` | 技术问题排查 | 工程师、开发者 |
| `project` | 项目风险评估 | 项目经理、Team Lead |
| `learning` | 学习计划/焦虑 | 学生、自学者 |
| `ai` | AI 协作问题 | AI 使用者、Prompt 工程师 |
| `product` | 产品问题分析 | 产品经理、UX |

---

## 快速开始

```bash
# 1. 安装
alias pdlf="bash ~/.pdlf/skill/scripts/pdlf.sh"

# 2. 创建你的第一个问题
pdlf new "我的第一个问题"

# 3. 按 7 阶段填写 problem.md
# 4. 完成后归档知识
```
