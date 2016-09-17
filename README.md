## 这是个啥?
自己用的emacs设置, 按照emacs for python的配置做了一些改写.

## Installation & Usage
.emacs.d/init.el中载入配置即可. 如果需要加载工作路径, 设置常量workspace-dir.
例:
```
(defconst workspace-dir "~/workspace")
(load-file "~/.emacs.d/elite/elite-init.el")
