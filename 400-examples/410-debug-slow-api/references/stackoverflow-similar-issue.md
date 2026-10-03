# Reference: Stack Overflow — MySQL DATE() function preventing index usage

**URL**: https://stackoverflow.com/questions/15393594/mysql-date-function-preventing-index-usage  
**关键结论**: Using `DATE(column)` prevents index usage. Use `BETWEEN` or range queries instead.

**摘录**:
> When you wrap a column in a function like DATE(), MySQL cannot use the index on that column because it has to evaluate the function for every row.

**应用**: 直接验证了 Transform 阶段的选择——改写为范围查询是标准解法。
