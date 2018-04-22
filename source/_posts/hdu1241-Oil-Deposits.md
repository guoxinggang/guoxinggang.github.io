---
title: hdu1241-Oil-Deposits
date: 2018-04-22 23:34:20
categories:
- acm
- HDU
tags:
- dfs
---

# 1.[题目](http://acm.hdu.edu.cn/showproblem.php?pid=1241)

{% asset_img a.jpg %}

{% asset_img b.jpg %}

# 2. 解析

* dfs 模板

# 3. 代码

```c++
#include <bits/stdc++.h>
using namespace std;

const int N = 100 + 10;
int n, m;
char mp[N][N];
int dir[][2] = {0, 1, 0, -1, 1, 0, -1, 0, 1, 1, 1, -1, -1, 1, -1, -1};

void dfs(int i, int j)
{
    mp[i][j] = '*';
    for (int k = 0; k < 8; ++ k) {
        int ni = i + dir[k][0];
        int nj = j + dir[k][1];
        if (ni >= 0 && ni < n && nj >= 0 && nj < m && mp[ni][nj] == '@') {
            dfs(ni, nj);
        }
    }
}

int main()
{
    while (scanf("%d %d", &n, &m)!=EOF) {
        if (n + m == 0) break;
        for (int i = 0; i < n; ++ i) scanf("%s", mp[i]);
        int num = 0;
        for (int i = 0; i < n; ++ i) {
            for (int j = 0; j < m; ++ j) {
                if (mp[i][j] == '@') {
                    dfs(i, j);
                    num++;
                }
            }
        }
        printf("%d\n", num);
    }
    return 0;
}
```