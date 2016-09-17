;; setting web-mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . js2-mode))

(defun custom-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-style-padding 0)
  (setq web-mode-script-padding 0)
  (setq web-mode-block-padding 0)
  (when (require 'auto-complete nil t)
    (auto-complete-mode t))
)
(add-hook 'web-mode-hook 'custom-web-mode-hook)


;; setting js2
(custom-set-variables
 '(js2-basic-offset 2)
 '(js2-global-externs (list "$" "window" "angular"))
)
(add-hook 'js-mode-hook 'js2-minor-mode)
(defun custom-js-mode-hook()
  (setq flycheck-mode 1)
  ;; (setq jslint-mode -1)
)
(add-hook 'js-mode-hook 'custom-js-mode-hook)
;; (add-hook 'js-mode-hook 'flycheck-mode) ;; 打开flycheck-mode
;; (add-hook 'js-mode-hook 'jslint-mode)
;; (add-hook 'js-mode-hook (lambda () (flycheck-mode -1))) ;; 关闭flycheck-mode
;; (add-hook 'js-mode-hook (lambda () (jslint-mode t))) ;; 关闭flycheck-mode

(provide 'elite-web)
