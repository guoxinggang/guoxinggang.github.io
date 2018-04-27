---
title: fzu2150-Fire-Game
date: 2018-04-28 00:07:36
categories:
- acm
- FZU
tags:
- 暴力
- bfs
---

# 1.[题目](http://acm.fzu.edu.cn/problem.php?pid=2150)

{% asset_img a.jpg %}

{% asset_img b.jpg %}

{% asset_img c.jpg %}

# 2.解析

* 暴力枚举两个点， bfs
* 增加一个二维数组用于记录扩展的层次
* 存在不成功的情况

# 3.代码

```c++
#include <iostream>
#include <algorithm>
#include <cstring>
#include <queue>
using namespace std;

const int INF = 0x3f3f3f3f;
int T, n, m, cas=0;
int dp[11][11];
int dir[][2]={1, 0, -1, 0, 0, 1, 0, -1};
char mp[11][11];
struct P{
    int x, y;
    P(){}
    P(int x,int y):x(x),y(y){}
};

int bfs(P a, P b)
{
    memset(dp, INF, sizeof(dp));
    queue<P> que;
    que.push(a), que.push(b);
    dp[a.x][a.y] = dp[b.x][b.y] = 0;
    while(!que.empty())
    {
        P nd = que.front(); que.pop();
        for (int i = 0; i < 4; ++ i)
        {
            P tmp;
            tmp.x = nd.x + dir[i][0];
            tmp.y = nd.y + dir[i][1];
            if(tmp.x >= 0 && tmp.x < n && tmp.y >= 0 && tmp.y < m && mp[tmp.x][tmp.y] == '#')
            {
                if(dp[tmp.x][tmp.y] > dp[nd.x][nd.y] + 1)
                {
                    dp[tmp.x][tmp.y] = dp[nd.x][nd.y] + 1;
                    que.push(tmp);
                }
            }
        }
    }
    int res = -INF;
    for (int i = 0; i < n; ++ i)
    {
        for (int j = 0; j < m; ++ j)
        {
            if(mp[i][j] == '#')
            {
                res = max(res, dp[i][j]);
            }
        }
    }
    return res;
}

int main()
{
    ios::sync_with_stdio(false);
    cin >> T;
    while(T--)
    {
        cin >> n >> m;
        int sum = 0;
        for (int i = 0; i < n; ++ i)
        {
            cin >> mp[i];
            for (int j = 0; j < m; ++ j)
            {
                if(mp[i][j] == '#') sum++;
            }
        }
        cout << "Case " << ++cas << ": ";
        if(sum <= 2)
        {
            cout << 0 << endl;
            continue;
        }
        int res = INF;
        for (int i = 0; i < n; ++ i)
        {
            for (int j = 0; j < m; ++ j)
            {
                if(mp[i][j] == '#')
                {
                    for (int u = 0; u < n; ++ u)
                    {
                        for (int v = 0; v < m; ++ v)
                        {
                            if(u <= i && v <= j) continue;
                            if(mp[u][v] == '#')
                            {
                                int ant = bfs(P(i, j), P(u, v));
                                res = min(res, ant);
                            }
                        }
                    }
                }
            }
        }
        if(res == INF) cout << -1 << endl;
        else cout << res << endl;
    }
    return 0;
}
```

