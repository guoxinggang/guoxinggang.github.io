---
title: Educational_Codeforces_Round_41_B_Lecture_Sleep.md
date: 2018-04-05 10:46:56
categories:
- acm
- Codeforces
tags:
- 模拟
- 前缀和
---

1. # [题目](http://codeforces.com/contest/961/problem/B)

   ![](Educational-Codeforces-Round-41-B-Lecture-Sleep-md\img_1.jpg)

   ![](Educational-Codeforces-Round-41-B-Lecture-Sleep-md\img_2.jpg)


2. # 解析

   - 题意：给定两个数字序列 a、t，当且仅当 t == 1 时， 取 a 对应的值，你可将任意区间 [i, i + k -1] 中的 t 变为 1， 但只能变一次， 求结果最大。
   - 将 t == 1 的 a 去掉后求前缀和，O(n) 求得区间最大。

3. # 代码

   ```c++
   #include <bits/stdc++.h>
   using namespace std;
   const int N = 1e5 + 10;
   int n, k, a[N], t;
   int sum1 = 0, sum2 = -1;

   int main(){
       scanf("%d %d", &n, &k);
       for (int i = 1; i <= n; ++ i) scanf("%d", &a[i]);
       for (int i = 1; i <= n; ++ i) {
           scanf("%d", &t);
           if (t == 1) {
               sum1 += a[i];
               a[i] = 0;
           }
       }
       for (int i = 2; i <= n; ++ i) a[i] += a[i-1];
       for (int i = k; i <= n; ++ i) {
           sum2 = max(sum2, a[i]-a[i-k]);
       }
       printf("%d\n", sum1 + sum2);
       return 0;
   }
   ```

   ​