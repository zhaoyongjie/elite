;; setting web-mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

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

;; setting js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))

(defun custom-js2-mode-hook ()
  (setq js2-basic-offset 2)
  (setq js2-global-externs '("$" "window" "angular"))
  ;; (flycheck-mode -1) ;; 关闭flycheck-mode
)
(add-hook 'js2-mode-hook 'custom-js2-mode-hook)

(provide 'elite-web)
