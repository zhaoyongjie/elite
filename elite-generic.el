;; setting system env path
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;;
(require 'better-defaults)

;; set theme
(require 'color-theme-tomorrow)
(color-theme-tomorrow--define-theme night)

;; set font family
(require 'elite-font)

;; ====================================================================
;; general things
(fset 'yes-or-no-p 'y-or-n-p)     ;; only type `y` instead of `yes`

(if (boundp 'workspace-dir)       ;; 如果定义了变量workspace-dir, 则设置启动目录
    (setq default-directory workspace-dir))

(global-linum-mode t)             ;; 全局加上行号
(if (not window-system)
    (setq linum-format "%d "))    ;; terminal version set line-num with 1 space padding

(delete-selection-mode t)         ;; C-y的时候, 如果有选择区域, 则先把选择区域删除后yank

;; (setq display-time-string-forms   ;; time-mode
;;       '((propertize (concat " " 24-hours ":" minutes " " time-zone))))
;; (display-time-mode t)

(setq default-process-coding-system '(utf-8 . utf-8)
      inhibit-startup-screen t    ;; 不显示启动界面

      ;; scroll one line at a time (less "jumpy" than defaults)
      ;; http://www.emacswiki.org/emacs/SmoothScrolling
      mouse-wheel-scroll-amount '(1 ((shift) . 1)) ;; one line at a time
      mouse-wheel-progressive-speed nil ;; don't accelerate scrolling
      mouse-wheel-follow-mouse 't ;; scroll window under mouse
      scroll-step 1 ;; keyboard scroll one line at a time

      column-number-mode t        ;; 显示列号
      show-paren-mode t           ;; 显示括号匹配
      x-stretch-cursor t          ;; 光标在TAB自负上会显示为一个大方块
      ring-bell-function 'ignore  ;; 设置禁止显示屏幕中的大方块
      fill-column 80              ;; M-q should fill at 80 chars, not 75
      )

(setq-default truncate-lines 1)   ;; no wordwrap

;; (setq-default show-trailing-whitespace t) ;;显示行尾空格
;; (add-hook 'write-file-hooks 'delete-trailing-whitespace) ;; Remove trailing whitespace
(setq-default indent-tabs-mode nil)

;;;
(require 'fill-column-indicator)
(setq fci-rule-column 80)

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
(ido-everywhere t)
(ido-ubiquitous-mode t)

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

;;; yasnippet nothing useful
;; (require 'yasnippet)
;; (yas-global-mode t)

;; https://github.com/joaotavora/yasnippet/issues/526
;; fix auto-complete & yas tab conflict
;; (defadvice ac-fallback-command (around no-yasnippet-fallback activate)
;;   (let ((yas-fallback-behavior nil))
;;     ad-do-it))

(require 'dedicated)

(require 'undo-tree)
(global-undo-tree-mode)

(require 'transpose-frame)

(magit-auto-revert-mode -1)

(provide 'elite-generic)
