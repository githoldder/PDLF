#!/usr/bin/env bash
#
# PDLF Scaffold Tool
# 一行命令初始化问题驱动工作流
#

set -e

PDLF_ROOT="${HOME}/.pdlf"
TEMPLATES_DIR="${PDLF_ROOT}/skill/templates"
VERSION="1.0.0"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# ============================================
# Helper Functions
# ============================================

print_header() {
    echo ""
    echo -e "${CYAN}╔════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║     PDLF — Problem-Driven Lifecycle    ║${NC}"
    echo -e "${CYAN}╚════════════════════════════════════════╝${NC}"
    echo ""
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_warn() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# ============================================
# Command: new
# ============================================

cmd_new() {
    local name="$1"
    local scene="${2:-tech}"

    if [ -z "$name" ]; then
        print_error "请提供问题名称"
        echo "用法: pdlf new <问题名称> [--scene <场景>]"
        echo ""
        echo "可用场景:"
        echo "  tech     — 技术问题排查"
        echo "  project  — 项目风险评估"
        echo "  learning — 学习计划/焦虑"
        echo "  ai       — AI 协作问题"
        echo "  product  — 产品问题分析"
        exit 1
    fi

    # Generate problem ID and directory name
    local date_str=$(date +%Y%m%d)
    local slug=$(echo "$name" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd 'a-z0-9-')
    local dirname="pdlf-${date_str}-${slug}"
    local problem_id="PDLF-${date_str}-001"

    if [ -d "$dirname" ]; then
        print_warn "目录 $dirname 已存在"
        read -p "是否覆盖? [y/N] " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            print_info "已取消"
            exit 0
        fi
        rm -rf "$dirname"
    fi

    mkdir -p "$dirname/references"

    # Select template
    local template_file="${TEMPLATES_DIR}/problem-${scene}.md"
    if [ ! -f "$template_file" ]; then
        template_file="${TEMPLATES_DIR}/problem-tech.md"
        print_warn "场景 '$scene' 不存在，使用默认模板 (tech)"
    fi

    # Generate problem.md
    sed -e "s/{{PROBLEM_NAME}}/$name/g" \
        -e "s/{{PROBLEM_ID}}/$problem_id/g" \
        -e "s/{{DATE}}/$(date +%Y-%m-%d)/g" \
        -e "s/{{TIME}}/$(date +%H:%M)/g" \
        "$template_file" > "$dirname/problem.md"

    # Generate risk.md
    cat > "$dirname/risk.md" <<EOF
# Risk: [风险名称]

> **关联问题**: [$problem_id](problem.md)
> **创建时间**: $(date +%Y-%m-%d)

## 当前评估
- severity: {1-10}
- probability: {1-10}
- unknown: {1-10}
- RPN: {计算值}

## 缓解状态
- [ ] Prevent: [预防措施]
- [ ] Detect: [检测手段]
- [ ] Recover: [恢复方案]

## 历史触发记录
- $(date +%Y-%m-%d): [首次发现]
EOF

    # Generate decisions.md
    cat > "$dirname/decisions.md" <<EOF
# Decisions

> **关联问题**: [$problem_id](problem.md)

## $(date +%Y-%m-%d): [决策标题]

**选项A**: [描述]
- 优点: 
- 缺点: 

**选项B**: [描述]
- 优点: 
- 缺点: 

**选择**: [A/B/其他]
**原因**: [一句话]
EOF

    print_success "已创建问题目录: $dirname"
    echo ""
    print_info "文件结构:"
    echo "  $dirname/"
    echo "    ├── problem.md      ← 主要工作文件"
    echo "    ├── risk.md         ← 风险记录"
    echo "    ├── decisions.md    ← 决策记录"
    echo "    └── references/     ← 参考文献"
    echo ""
    print_info "下一步:"
    echo "  1. cd $dirname"
    echo "  2. 编辑 problem.md，按 7 阶段填写"
    echo "  3. 运行 'pdlf checklist triage' 查看检查清单"
}

# ============================================
# Command: checklist
# ============================================

cmd_checklist() {
    local stage="$1"
    local checklist_dir="${PDLF_ROOT}/300-methods/checklist-templates"

    if [ -z "$stage" ]; then
        print_error "请指定阶段"
        echo "用法: pdlf checklist <stage>"
        echo ""
        echo "可用阶段:"
        echo "  triage     — Triage 检查清单"
        echo "  diagnose   — Diagnose 检查清单"
        echo "  transform  — Transform 检查清单"
        echo "  verify     — Verify 检查清单"
        echo "  learn      — Learn 检查清单"
        exit 1
    fi

    local stage_num=""
    case "$stage" in
        triage) stage_num="351" ;;
        diagnose) stage_num="353" ;;
        transform) stage_num="354" ;;
        verify) stage_num="352" ;;
        learn) stage_num="355" ;;
        *)
            print_error "未知阶段: $stage"
            exit 1
            ;;
    esac

    local file="${checklist_dir}/${stage_num}-${stage}-checklist.md"
    if [ -f "$file" ]; then
        echo ""
        cat "$file"
        echo ""
    else
        print_error "检查清单文件不存在: $file"
        exit 1
    fi
}

# ============================================
# Command: info
# ============================================

cmd_info() {
    local subcmd="${1:-all}"

    case "$subcmd" in
        version)
            echo "PDLF Scaffold v${VERSION}"
            ;;
        one-pager)
            cat <<'EOF'

╔════════════════════════════════════════════════════════════╗
║                    一个原则                                 ║
║           Attention Follows the Problem                    ║
║                    注意力跟着问题走                          ║
╠══════════════════════════╦═════════════════════════════════╣
║        Problem Tree       ║           Risk Tree             ║
║        问题发生了          ║          问题还没发生            ║
║  "真正的问题是什么？"       ║    "还可能在哪里失败？"           ║
║        效率提升           ║        成本降低 + 预防            ║
╠══════════════════════════╩═════════════════════════════════╣
║                    三个方法                                 ║
║   5Why(构建问题) · 问题转化(降低难度) · FMEA(构建风险)        ║
╠════════════════════════════════════════════════════════════╣
║                    四个效果                                 ║
║   更短时间 + 更低成本 + 可视化 + 可复用                       ║
╚════════════════════════════════════════════════════════════╝

EOF
            ;;
        stages)
            cat <<'EOF'

7 阶段循环:

  ① Discover    → 哪里不对？
  ② Triage      → 值得解决吗？
  ③ Diagnose    → 真正的问题是什么？
  ④ Transform   → 还能怎么问？
  ⑤ Solve       → 怎么实现？
  ⑥ Verify      → 真的解决了吗？
  ⑦ Learn       → 下次如何更早发现？

关键规则:
  · Triage 两次 (初筛 → Diagnose 后重新评估)
  · Risk Tree 贯穿全程
  · Human Gate (AI 停在 Transform)

EOF
            ;;
        *)
            print_header
            cat <<EOF
PDLF — Problem-Driven Lifecycle Framework
版本: ${VERSION}

一个原则: Attention Follows the Problem
两颗树: Problem Tree + Risk Tree
三个方法: 5Why + 问题转化 + FMEA
四个效果: 更短时间 + 更低成本 + 可视化 + 可复用

7 阶段: Discover → Triage → Diagnose → Transform → Solve → Verify → Learn

仓库: https://github.com/githoldder/PDLF

快速开始:
  pdlf new <问题名称>          创建新问题
  pdlf checklist <stage>       查看检查清单
  pdlf info --one-pager        查看框架总览
  pdlf info --stages           查看阶段详解

EOF
            ;;
    esac
}

# ============================================
# Command: search
# ============================================

cmd_search() {
    local query="$1"
    local platform="${2:-all}"

    if [ -z "$query" ]; then
        print_error "请提供搜索关键词"
        echo "用法: pdlf search <关键词> [--so|--github|--all]"
        exit 1
    fi

    local encoded_query=$(printf '%s' "$query" | sed 's/ /+/g')

    print_info "搜索: $query"
    echo ""

    if [ "$platform" = "so" ] || [ "$platform" = "all" ]; then
        echo -e "${CYAN}Stack Overflow:${NC}"
        echo "  https://stackoverflow.com/search?q=${encoded_query}"
        echo ""
    fi

    if [ "$platform" = "github" ] || [ "$platform" = "all" ]; then
        echo -e "${CYAN}GitHub Issues:${NC}"
        echo "  https://github.com/search?q=${encoded_query}&type=issues"
        echo ""
    fi

    if [ "$platform" = "all" ]; then
        echo -e "${CYAN}Google:${NC}"
        echo "  https://www.google.com/search?q=${encoded_query}"
        echo ""
    fi

    print_info "建议按 P0→P3 优先级搜索:"
    echo "  P0 (精确): \"${query}\""
    echo "  P1 (相似): \"${query} 解决方案\""
    echo "  P2 (方法): \"${query} 最佳实践\""
    echo "  P3 (背景): \"${query} 原理\""
}

# ============================================
# Main
# ============================================

main() {
    local cmd="${1:-}"
    shift || true

    case "$cmd" in
        new)
            cmd_new "$@"
            ;;
        checklist|cl)
            cmd_checklist "$@"
            ;;
        info|i)
            cmd_info "$@"
            ;;
        search|s)
            cmd_search "$@"
            ;;
        version|v)
            echo "PDLF Scaffold v${VERSION}"
            ;;
        *)
            print_header
            cat <<'EOF'
用法: pdlf <命令> [选项]

命令:
  new <名称> [选项]     创建新问题目录
    --scene <场景>      指定场景模板 (tech|project|learning|ai|product)

  checklist <阶段>      显示检查清单
    可用阶段: triage, diagnose, transform, verify, learn

  info [子命令]         显示框架信息
    --one-pager         显示 One-Pager 框架图
    --stages            显示 7 阶段详解
    --version           显示版本

  search <关键词>       社区搜索辅助
    --so                Stack Overflow
    --github            GitHub Issues
    --all               全部平台 (默认)

示例:
  pdlf new "API响应变慢"
  pdlf new "考研复习焦虑" --scene learning
  pdlf checklist triage
  pdlf info --one-pager
  pdlf search "MySQL 索引失效"

EOF
            ;;
    esac
}

main "$@"
