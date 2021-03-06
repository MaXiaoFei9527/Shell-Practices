#!/bin/bash

:<<!
临时文件的安全问题：
在/tmp目录直接创建文件，该文件默认是所有人可读的。
其次，如果攻击者知道临时文件的文件名，他可以创建符号链接，链接到临时文件，可能导致系统运行异常。攻击者也可能向脚本提供一些恶意数据。因此，临时文件最好使用不可预测、每次都不一样的文件名。
最后，临时文件使用完毕，应该删除。但是，脚本意外退出时，往往会忽略清理临时文件。

临时文件的最佳实践：
1、创建前检查文件是否已经存在。
2、确保临时文件已成功创建。
3、临时文件必须有权限的限制。
4、临时文件要使用不可预测的文件名。
5、脚本退出时，要删除临时文件（使用trap命令）。

示例脚本：
!
# 指定trap规则，当脚本遇到EXIT信号时清理临时文件
trap 'rm -f "$TMPFILE"' EXIT
# 为了确保临时文件创建成功，mktemp命令后面最好使用 OR 运算符（||），指定创建失败时退出脚本
TMPFILE=$(mktemp) || exit 1
ls /etc > $TMPFILE
if grep -qi "kernel" $TMPFILE; then
  echo 'find'
fi



