============
这是个啥?
============
自己用的emacs设置, 按照emacs for python的配置做了一些改写.

========================
Installation & Usage
========================
从github clone, 并且把submoudles一并clone
.. code-block::
   cd ~/.emacs.d
   git clone --recursive git@github.com:zhaoyongjie/elite.git

``~/.emacs.d/init.el``, 如果需要加载工作路径, 设置常量**workspace-dir**
.. code-block:: shell
   (defconst workspace-dir "~/workspace")
   (load-file "~/.emacs.d/elite/elite-init.el")
