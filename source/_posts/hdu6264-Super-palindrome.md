---
title: hdu6264-Super-palindrome
date: 2018-05-08 00:11:34
categories:
- acm
- hdu
- 2017中国大学生程序设计竞赛-杭州站-重现赛
tags:
- 思维题
---

# 1.[题目](http://acm.hdu.edu.cn/showproblem.php?pid=6264)

[比赛题目:http://acm.hdu.edu.cn/downloads/CCPC2018-Hangzhou-ProblemSet.pdf](http://acm.hdu.edu.cn/downloads/CCPC2018-Hangzhou-ProblemSet.pdf)

{% asset_img a.jpg %}

{% asset_img b.jpg %}

# 2.解析

* 奇数位置字符相同，偶数位置字符相同

# 3.代码

```c++
#include <bits/stdc++.h>
using namespace std;

int T;
string str;
map<char, int> mpa, mpb;

int main()
{
    cin >> T;
    while (T--) {
        mpa.clear(); mpb.clear();
        int numa = 0, numb = 0, na=0, nb=0;
        cin >> str;
        for (int i = 0; i < str.size(); i += 2) {
            mpa[str[i]]++;
            numa++;
        }
        for (int i = 1; i < str.size(); i += 2) {
            mpb[str[i]]++;
            numb++;
        }
        for (auto it = mpa.begin(); it != mpa.end(); ++ it) {
            na = max(na, it->second);
        }
        for (auto it = mpb.begin(); it != mpb.end(); ++ it) {
            nb = max(nb, it->second);
        }
        cout << (numa-na) + (numb-nb) << endl;
    }
    return 0;
}
```

