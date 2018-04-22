---
title: poj3278-Catch-That-Cow
date: 2018-04-22 23:13:06
categories:
- acm
- POJ
tags:
- bfs
---

# 1. [题目](http://poj.org/problem?id=3278)

{% asset_img a.jpg %}

{% asset_img b.jpg %}

# 2. 解析

* 三种移动状态，+1， -1， *2, 典型的搜索题目
* 求最少步数，选择bfs
* 限制搜索范围

# 3. 代码

```c++
//#include <bits/stdc++.h>
#include <cstdio>
#include <queue>
#include <cstring>
using namespace std;

const int N = 4e5 + 10;
int n, k;
int vis[N];

typedef struct Node{
    int p, step;
}Node;

int bfs(int st)
{
    queue<Node> que;
    que.push(Node{st, 0});
    vis[st] = 1;
    while (!que.empty()) {
        Node fro = que.front(); que.pop();
        if (fro.p == k) return fro.step;
        if (fro.p + 1 < N && !vis[fro.p + 1]) {
            vis[fro.p + 1] = 1;
            que.push(Node{fro.p + 1, fro.step + 1});
        }
        if (fro.p - 1 >= 0 && !vis[fro.p - 1]) {
            vis[fro.p - 1] = 1;
            que.push(Node{fro.p - 1, fro.step + 1});
        }
        if (fro.p * 2 < N && !vis[fro.p * 2]) {
            vis[fro.p * 2] = 1;
            que.push(Node{fro.p * 2, fro.step + 1});
        }
    }
    return 0;
}

int main()
{
    scanf("%d %d", &n, &k);
    memset(vis, 0, sizeof(vis));
    printf("%d\n", bfs(n));
    return 0;
}
```

