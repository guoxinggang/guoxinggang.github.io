---
title: poj3126-Prime-Path
date: 2018-04-27 23:26:19
categories:
- acm
- POJ
tags:
- bfs
---

# 1.[题目](http://poj.org/problem?id=3126)

{% asset_img a.jpg %}

{% asset_img b.jpg %}

# 2.解析

* 求两个四位素数途径（长度四位）素数路径的最少转移步骤
* 四位每一位都有0~9的状态转移（注意没有前导）
* bfs 求 最少转移步骤

# 3.代码

```c++
#include <cstdio>
#include <cstring>
#include <queue>
using namespace std;

const int N = 1e4 + 10;
int n, a, b;
int vis[N], used[N];

struct Node{
    int val[4], step;
    Node(){}
    Node(int x, int st) {
        val[0] = x / 1000;
        val[1] = x / 100 % 10;
        val[2] = x / 10 % 10;
        val[3] = x % 10;
        step = st;
    }
    int getval(){
        return val[0] * 1000 + val[1] * 100 + val[2] * 10 + val[3];
    }
}st, en;

bool isprime(int x)
{
    for (int i = 2; i * i <= x; ++ i) {
        if (x % i == 0) return false;
    }
    return true;
}

void get()
{
    memset(vis, 0, sizeof(vis));
    for (int i = 1000; i < 10000; ++ i) {
        if (isprime(i)) vis[i] = 1;
    }
}

int bfs(Node st)
{
    queue<Node> que;
    que.push(st);
    used[st.getval()] = 1;
    while (!que.empty()) {
        Node fro = que.front(); que.pop();
        if (fro.getval() == en.getval()) return fro.step;
        for (int i = 0; i <= 9; ++ i) {
            Node nf = fro;
            if (i != 0) nf.val[0] = i;
            if (vis[nf.getval()] && !used[nf.getval()]) {
                que.push(Node(nf.getval(), nf.step+1));
                used[nf.getval()] = 1;
            }
            nf = fro;
            nf.val[1] = i;
            if (vis[nf.getval()] && !used[nf.getval()]) {
                que.push(Node(nf.getval(), nf.step+1));
                used[nf.getval()] = 1;
            }
            nf = fro;
            nf.val[2] = i;
            if (vis[nf.getval()] && !used[nf.getval()]) {
                que.push(Node(nf.getval(), nf.step+1));
                used[nf.getval()] = 1;
            }
            nf = fro;
            nf.val[3] = i;
            if (vis[nf.getval()] && !used[nf.getval()]) {
                que.push(Node(nf.getval(), nf.step+1));
                used[nf.getval()] = 1;
            }
        }
    }
    return 0;
}

int main()
{
    get();
    scanf("%d", &n);
    while (n--) {
        scanf("%d %d", &a, &b);
        st = Node(a, 0);
        en = Node(b, 0);
        memset(used, 0, sizeof(used));
        printf("%d\n", bfs(st));
    }
    return 0;
}
```

