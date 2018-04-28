---
title: poj3087-Shuffle-m-Up
date: 2018-04-28 22:42:07
categories:
- acm
- POJ
tags:
- 模拟
---

# 1.[题目](http://poj.org/problem?id=3087)

{% asset_img a.jpg %}

{% asset_img b.jpg %}

{% asset_img c.jpg %}

# 2.解析

* 阅读理解，不卡时限，模拟
* 给定两副牌s1, s2, 求最终能否交叉排达到 s3 的状态，先插s2,在s1;前 n 个 给 s1, 后 n 个 给 s2
* 上诉题意翻译于AC代码。。。

# 3.代码

```c++
#include <iostream>
#include <string>
#include <map>
#include <cstdio>
using namespace std;

int t, n;
string s1, s2, s3;
map<string, bool> mp;

int main()
{
    ios_base::sync_with_stdio(0);
    cin >> t;
    for (int tt = 1; tt <= t; ++ tt) {
        mp.clear();
        cin >> n;
        cin >> s1 >> s2 >> s3;
        bool flag = false;
        int step = 0;
        while (true) {
            string s4 = "";
            for (int i = 0; i < n; ++ i) {
                s4 += s2[i]; s4 += s1[i];
            }
            step++;
            if (s4 == s3) {
                flag = true;
                break;
            }
            if(mp[s4]) break;
            mp[s4] = true;
            s1 = s4.substr(0, n);
            s2 = s4.substr(n, 2*n);
        }
        if (flag) {
            printf("%d %d\n", tt, step);
        }
        else {
            printf("%d -1\n", tt);
        }
    }
    return 0;
}
```

