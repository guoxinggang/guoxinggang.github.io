---
layout: "\x96"
title: poj3279-Fliptile
date: 2018-04-26 19:54:58
categories:
- acm
- POJ
tags:
- 暴力
- 状态压缩
---

# 1.[题目](http://poj.org/problem?id=3279)

{% asset_img a.jpg %}

{% asset_img b.jpg %}

# 2.解析

* 翻转问题。每次反转（x, y), 其上，下，左，右都反转。求最小步骤反转使得全0
* 化简问题。枚举第一行反转状态（2^m)并且向下检查，当n-1行时，前n-1行保证全0，只需检查最后一行是否有1存在判断方案是否成立。
* 当（x-1, y) 为 1 ，只需反转（x, y) 即可
* 时间复杂度O(n * m * 2 ^ m)

# 3.代码

```c++
//#include <bits/stdc++.h>
#include <cstdio>
#include <cstring>
using namespace  std;

const int N = 20;
const int INF = 0x3f3f3f3f;
int n, m;
int mp[N][N], fi[N][N], rs[N][N];
int dir[][2]={0, 0, 0, 1, 0, -1, 1, 0, -1, 0};

//取得(x, y)的状态，同本身及四个方向的反转状态相关
int get(int x, int y) {
    int r = mp[x][y];
    for (int i = 0; i < 5; ++ i) {
        int nx = x + dir[i][0];
        int ny = y + dir[i][1];
        if (nx >= 0 && nx < n && ny >= 0 && ny < m) r += fi[nx][ny];
    }
    return r & 1;
}

//由第一行向下枚举，计算总的反转次数 r
int calc()
{
    for (int i = 1; i < n; ++ i) {
        for (int j = 0; j < m; ++ j) {
            if (get(i-1, j)) fi[i][j] = 1;
        }
    }
    for (int i = 0; i < m; ++ i) {
        if (get(n-1, i)) return -1;
    }
    int r = 0;
    for (int i = 0; i < n; ++ i) {
        for (int j = 0; j < m; ++ j) {
            r += fi[i][j];
        }
    }
    return r;
}

//枚举第一行的反转状态 2^m
void solve()
{
    int cnt = INF;
    for (int i = 0; i < (1<<m); ++ i) {
        memset(fi, 0, sizeof(fi));
        for (int j = 0; j < m; ++ j) {
            fi[0][m-j-1] = i >> j & 1;
        }
        int cntt = calc();
        if (cntt >= 0 && cntt < cnt) {
            cnt = cntt;
            memcpy(rs, fi, sizeof(fi));
        }
    }
    if (cnt == INF ) printf("IMPOSSIBLE\n");
    else {
        for (int i = 0; i < n; ++ i){
            for (int j = 0; j < m; ++ j){
                if (j == 0)
                    printf("%d", rs[i][j]);
                else
                    printf(" %d", rs[i][j]);
            }
            printf("\n");
    }
    }
}

int main()
{
    while (scanf("%d %d", &n, &m)!=EOF) {
        for (int i = 0; i < n; ++ i) {
            for (int j = 0; j < m; ++ j) {
                scanf("%d", &mp[i][j]);
            }
        }
        solve();
    }
    return 0;
}
```

