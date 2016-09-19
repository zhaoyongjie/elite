;; 设置系统env path
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; general things
(custom-set-variables
 '(inhibit-startup-screen t)
 '(global-linum-mode t)
 )

(fset 'yes-or-no-p 'y-or-n-p) ;; only type `y` instead of `yes`

(if (boundp 'workspace-dir)
    (setq default-directory workspace-dir))

(setq default-process-coding-system '(utf-8 . utf-8)
      ;; scroll one line at a time (less "jumpy" than defaults)
      ;; http://www.emacswiki.org/emacs/SmoothScrolling
      mouse-wheel-scroll-amount '(1 ((shift) . 1)) ;; one line at a time
      mouse-wheel-progressive-speed nil ;; don't accelerate scrolling
      mouse-wheel-follow-mouse 't ;; scroll window under mouse
      scroll-step 1 ;; keyboard scroll one line at a time

      column-number-mode t        ;;显示列号
      show-paren-mode t           ;;显示括号匹配
      x-stretch-cursor t          ;;光标在TAB自负上会显示为一个大方块
      ring-bell-function 'ignore  ;; 设置禁止显示屏幕中的大方块
      fill-column 80              ;; M-q should fill at 80 chars, not 75
)

(setq-default show-trailing-whitespace t) ;;显示行尾空格
;; (add-hook 'before-save-hook 'delete-trailing-whitespace) ;;保存时自动删除行尾空格
(setq-default indent-tabs-mode nil)

;; set custom theme
(require 'color-theme-tomorrow)
(color-theme-tomorrow--define-theme night)

;; set font family
(set-frame-font "Monaco 12")
;; 如果是GUI版本, 则设置中文字体, 如果不做判断terminal中的emacs会报错
(if window-system
    (set-fontset-font "fontset-default" 'han '("STHeiti")))

;;;
(require 'better-defaults)

;;;
(require 'comment-dwim-2)
(global-set-key "\M-;" 'comment-dwim-2)

;;;
(require 'browse-kill-ring+)

;;;
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;;
(require 'ido-ubiquitous)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

;;;
(require 'idle-highlight-mode)
(defun my-coding-hook ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t)
  (if window-system (hl-line-mode t))
  (idle-highlight-mode t))
(add-hook 'emacs-lisp-mode-hook 'my-coding-hook)
(add-hook 'js2-mode-hook 'my-coding-hook)
(add-hook 'python-mode-hook 'my-coding-hook)

;;;
(require 'find-file-in-project)

;;;
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;;;
(require 'yasnippet)
(yas-global-mode t)

;; https://github.com/joaotavora/yasnippet/issues/526
;; 修正 auto complete和yas tab冲突
(defadvice ac-fallback-command (around no-yasnippet-fallback activate)
  (let ((yas-fallback-behavior nil))
    ad-do-it))

;;;
(require 'fill-column-indicator)
(setq fci-rule-column 80)

;; ====================================
;; install by packages archives
(global-flycheck-mode)
(setq-default flycheck-temp-prefix ".")
(setq flycheck-disable-checker '(javascript-jshint))
(setq flycheck-checkers '(javascript-eslint
                          python-pylint
                          json-jsonlint))
(setq flycheck-eslintrc "~/.eslintrc")
(setq flycheck-pylintrc "~/.pylintrc")

;; ====================================
;; 暂时的设置
(add-hook 'org-mode-hook
          (lambda () (setq truncate-lines nil)))

(eval-after-load "sql"
  '(load-library "sql-indent"))

(provide 'elite-generic)
