---
title: poj3414-Pots
date: 2018-04-28 09:46:36
categories:
- acm
- POJ
tags:
- bfs
---

# 1.[题目](http://poj.org/problem?id=3414)

{% asset_img a.jpg %}

{% asset_img b.jpg %}

# 2.解析

* 六种状态：FILL 1;   FILL 2;  DROUP 1;  DROUP 2;  POUR(1,2);  POUR(2,1);
* 求最短转移状态，bfs
* 采用常规的记录前驱的方法记录路径

# 3.代码

```c++
#include <cstdio>
#include <cstring>
#include <queue>
#include <algorithm>
using namespace std;

const int N = 110;
int a, b, c, x, y;
int vis[N][N];

struct Node{
    int a, b, step;
    Node(){step=0;}
    Node(int a, int b, int step):a(a),b(b),step(step){}
} path[N][N];
vector<int> rc;

int bfs(Node st)
{
    queue<Node> que;
    que.push(st);
    vis[st.a][st.b] == 1;
    while (!que.empty()) {
        Node fro = que.front(); que.pop();
//        cout << fro.a << " " << fro.b << " " << fro.step << endl;
//        cout << "fa: --> " << path[fro.a][fro.b].a << " " << path[fro.a][fro.b].b << " " << path[fro.a][fro.b].step << endl;
        if (fro.a == c || fro.b == c) {
            x = fro.a; y = fro.b;
            return fro.step;
        }
        if (fro.a != a && !vis[a][fro.b]) {
            que.push(Node(a, fro.b, fro.step+1));
            vis[a][fro.b] = 1;
            path[a][fro.b] = Node(fro.a, fro.b, 1);
        }
        if (fro.b != b && !vis[fro.a][b]) {
            que.push(Node(fro.a, b, fro.step+1));
            vis[fro.a][b] = 1;
            path[fro.a][b] = Node(fro.a, fro.b, 2);
        }
        if (fro.a != 0 && !vis[0][fro.b]) {
            que.push(Node(0, fro.b, fro.step+1));
            vis[0][fro.b] = 1;
            path[0][fro.b] = Node(fro.a, fro.b, 3);
        }
        if (fro.b != 0 && !vis[fro.a][0]) {
            que.push(Node(fro.a, 0, fro.step+1));
            vis[fro.a][0] = 1;
            path[fro.a][0] = Node(fro.a, fro.b, 4);
        }
        if (fro.a > 0 && fro.b != b) {
            int c = min(fro.a, b-fro.b);
            if (!vis[fro.a-c][fro.b+c]) {
                que.push(Node(fro.a-c, fro.b+c, fro.step+1));
                vis[fro.a-c][fro.b+c] = 1;
                path[fro.a-c][fro.b+c] = Node(fro.a, fro.b, 5);
            }
        }
        if (fro.b > 0 && fro.a != a) {
            int c = min(fro.b, a-fro.a);
            if (!vis[fro.a+c][fro.b-c]) {
                que.push(Node(fro.a+c, fro.b-c, fro.step+1));
                vis[fro.a+c][fro.b-c] = 1;
                path[fro.a+c][fro.b-c] = Node(fro.a, fro.b, 6);
            }
        }
    }
    return 0;
}

int main()
{
    scanf("%d %d %d", &a, &b, &c);
    int r = bfs(Node(0, 0, 0));
    if (!r) {
        printf("impossible\n");
        return 0;
    }
    printf("%d\n", r);
    while (path[x][y].a + path[x][y].b != 0) {
        rc.push_back(path[x][y].step);
//        cout << x << " " << y << endl;
//        cout << path[x][y].a << " * " << path[x][y].b << endl;
        int nx = path[x][y].a;
        int ny = path[x][y].b;
        x = nx; y = ny;
    }
    rc.push_back(path[x][y].step);
    reverse(rc.begin(), rc.end());
    for (int i = 0; i < rc.size(); ++ i) {
        switch(rc[i]){
            case 1: printf("FILL(1)\n");break;
            case 2: printf("FILL(2)\n");break;
            case 3: printf("DROP(1)\n");break;
            case 4: printf("DROP(2)\n");break;
            case 5: printf("POUR(1,2)\n");break;
            case 6: printf("POUR(2,1)\n");break;
        }
    }
    return 0;
}
```

