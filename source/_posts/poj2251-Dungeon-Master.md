---
title: poj2251-Dungeon-Master
date: 2018-04-21 23:57:31
categories:
- acm
- POJ
tags:
- bfs
---

# 1. [题目](http://poj.org/problem?id=2251)

{% asset_img a.jpg %}

{% asset_img b.jpg %}

{% asset_img c.jpg %}

# 2. 解析

* bfs模拟

# 3. 代码

```c++
#include <cstdio>
#include <queue>
#include <cstring>
using namespace std;

int l, r, c;
char mp[33][33][33];
int vis[33][33][33];

typedef struct node{
    int l, r, c, step;
}Node;
Node st, en;
int dir[6][3] = {0, 0, 1, 0, 0, -1, 0, 1, 0, 0, -1, 0, 1, 0, 0, -1, 0, 0};

int dfs()
{
    queue<Node> que;
    que.push(st);
    vis[st.l][st.r][st.c] = 1;
    while (!que.empty()) {
        Node fro = que.front(); que.pop();
        if (mp[fro.l][fro.r][fro.c] == 'E') return fro.step;
        for (int i = 0; i < 6; ++ i) {
            int nl = fro.l + dir[i][0];
            int nr = fro.r + dir[i][1];
            int nc = fro.c + dir[i][2];
            if (nl >= 0 && nl < l && nr >= 0 && nr < r && nc >= 0 && nc < c && !vis[nl][nr][nc] && mp[nl][nr][nc] != '#') {
                vis[nl][nr][nc] = 1;
                que.push(Node{nl, nr, nc, fro.step+1});
            }
        }
    }
    return 0;
}

int main()
{
    while (scanf("%d %d %d", &l, &r, &c)!=EOF) {
        if (l + r + c == 0) break;
        for (int i = 0; i < l; ++ i) {
            for (int j = 0; j < r; ++ j) {
                scanf("%s", mp[i][j]);
                for (int k = 0; k < c; ++ k) {
                    if (mp[i][j][k] == 'S') st = Node{i, j, k, 0};
                    if (mp[i][j][k] == 'E') en = Node{i, j, k, 0};
                }
            }
        }
        memset(vis, 0, sizeof(vis));
        int r = dfs();
        if (r) printf("Escaped in %d minute(s).\n", r);
        else printf("Trapped!\n");
    }
    return 0;
}
```

