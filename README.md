## Usage
emacs configurtion by myself

```bash
   cd ~/.emacs.d
   git clone git@github.com:zhaoyongjie/elite.git
   vi ~/.emacs.d/init.el
```

## edit init.el
```lisp
   (defconst workspace-dir "~/workspace")
   (defconst kb-dir "~/workspace/board/diary/kb")
   (defconst publish-dir "~/workspace/www")

   (load-file "~/.emacs.d/elite/elite-init.el")
```
