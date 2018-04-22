---
title: hdu2612-Find-a-way
date: 2018-04-22 12:55:41
categories:
- acm
- HDU
tags:
- bfs
---

# 1. [题目](http://acm.hdu.edu.cn/showproblem.php?pid=2612)

{% asset_img a.jpg %}

{% asset_img b.jpg %}

# 2. 解析

* 题目求 Y 和 M 到达同一个 @ 的 最短时间（步数 * 11), 选择两次bfs实现
* 坑点:  存在 @  不可达

# 3. 代码

```c++
#include <bits/stdc++.h>
using namespace std;

const int N = 222;
int n, m;
typedef struct node{
    int i, j, step;
}Node;
Node Y, M;
char mp[N][N];
int vis[N][N][2], ti[N][N];
int dir[][2]={0,1,0,-1,1,0,-1,0};

void dfs(Node st, int k)
{
    queue<Node> que;
    que.push(st);
    vis[st.i][st.j][k] = 1;
    while (!que.empty()) {
        Node fro = que.front(); que.pop();
        if (mp[fro.i][fro.j]=='@') ti[fro.i][fro.j] += fro.step;
        for (int i = 0; i < 4; ++ i) {
            int ni = fro.i + dir[i][0];
            int nj = fro.j + dir[i][1];
            if(ni >= 0 && ni < n && nj >= 0 && nj < m && !vis[ni][nj][k] && mp[ni][nj] != '#') {
                vis[ni][nj][k] = 1;
                que.push(Node{ni, nj, fro.step+1});
            }
        }
    }
}

int main()
{
    while (scanf("%d %d", &n, &m)!=EOF) {
        for (int i = 0; i < n; ++ i) {
            scanf("%s", mp[i]);
            for (int j = 0; j < m; ++ j) {
                if (mp[i][j] == 'Y') Y = Node{i, j, 0};
                if (mp[i][j] == 'M') M = Node{i, j, 0};
            }
        }
        memset(ti, 0, sizeof(ti));
        memset(vis, 0, sizeof(vis));
        dfs(Y, 0);
        dfs(M, 1);
        int r = 0x3f3f3f3f;
        for (int i = 0; i < n; ++ i) {
            for (int j = 0; j < m; ++ j) {
                if (mp[i][j] == '@' && vis[i][j][0]+vis[i][j][1]!=0) r = min(r, ti[i][j]);   //@必须可达
            }
        }
        printf("%d\n", r * 11);
    }
    return 0;
}

```

