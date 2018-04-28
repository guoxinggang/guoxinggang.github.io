---
title: uva11624-Fire!
date: 2018-04-29 00:00:30
categories:
- acm
- UVA
tags:
- bfs
---

# 1.[题目](https://vjudge.net/contest/223468#problem/J)

{% asset_img a.pdf %}

# 2.解析

* 一个平面迷宫中有一个人，迷宫中有些点起火了，火和人每个单位时间只能向相邻的格子移动，其中有一些空间被墙壁占据，问这个人在不被火烧到的情况下，离开迷宫的最快时间。
* 求迷宫中的最短路，bfs
* 优化合并队列，先入队火节点，最后入队人节点，分类操作

# 3.代码

```C++
#include <bits/stdc++.h>
using namespace std;

const int N = 1010;
const int INF = 0x3f3f3f3f;
int t, r, c;
char mp[N][N];
int step[N][N];
int dir[][2] = {0, 1, 0, -1, 1, 0, -1, 0};
struct node{
    int x, y, step, f;
    node(){}
    node(int x, int y, int step, int f):x(x),y(y),step(step),f(f){}
} J;

void bfs()
{
    queue<node> que;
    for (int i = 0; i < r; ++ i) {
        for (int j = 0; j < c; ++ j) {
            if (mp[i][j] == 'J') J = node(i, j, 0, 0);
            if (mp[i][j] == 'F') que.push(node(i, j, 0, 1));
            step[i][j] = INF;
        }
    }
    step[J.x][J.y] = 0;
    que.push(J);
    while (!que.empty()) {
        node fro = que.front(); que.pop();
        if(fro.f == 0 && (fro.x == 0 || fro.x == r-1 || fro.y == 0 || fro.y == c-1)) {
            printf("%d\n", fro.step+1);
            return;
        }
        for (int i = 0; i < 4; ++ i) {
            int nx = fro.x + dir[i][0];
            int ny = fro.y + dir[i][1];
            if (nx >= 0 && nx < r && ny >= 0 && ny < c && mp[nx][ny] == '.') {
                if (fro.f) {
                    mp[nx][ny] = 'F';
                    que.push(node(nx, ny, fro.step+1, fro.f));
                } else if (step[nx][ny] > step[fro.x][fro.y]+1) {
                    step[nx][ny] = step[fro.x][fro.y]+1;
                    que.push(node(nx, ny, fro.step+1, fro.f));
                }
            }
        }
    }
    printf("IMPOSSIBLE\n");
}

int main()
{
    scanf("%d", &t);
    while (t--) {
        scanf("%d %d", &r, &c);
        for (int i = 0; i < r; ++ i) {
            scanf("%s", mp[i]);
        }
        bfs();
    }
    return 0;
}
```

