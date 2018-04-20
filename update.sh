# 保存源文件
git add .
git commit -m "save source file"
git push origin master:Hexo-Blog

# 更新静态网页
#hexo clean
hexo g
hexo d