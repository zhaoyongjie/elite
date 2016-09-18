;; setting web-mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))

(defun custom-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-style-padding 0)
  (setq web-mode-script-padding 0)
  (setq web-mode-block-padding 0)
  ;; (when (executable-find "eslint")
  ;;   (flycheck-select-checker 'javascript-eslint))
  (when (require 'fill-column-indicator nil t)
    (fci-mode t))
)
(add-hook 'web-mode-hook 'custom-web-mode-hook)

;; setting vue-mode, vue-mode is mmm-mode's fork
;; https://github.com/CodeFalling/vue-mode
;; (add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
(defun custom-vue-mode-hook ()
  "Hooks for vue mode."
  ;; (when (executable-find "eslint")
  ;;   (flycheck-select-checker 'javascript-eslint))
  ;; (flycheck-mode t)
  ;; (mmm-clear-overlays)
  (setq mmm-submode-decoration-level 0)
  (setq js-indent-level 2)
  (when (require 'fill-column-indicator nil t)
    (fci-mode t))
)
(add-hook 'vue-mode-hook 'custom-vue-mode-hook)

;; setting js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))

(defun custom-js2-mode-hook ()
  (setq js2-basic-offset 2)
  (flycheck-mode t)
  (when (executable-find "eslint")
    (flycheck-select-checker 'javascript-eslint))
  (when (require 'fill-column-indicator nil t)
    (fci-mode t))
)
(add-hook 'js2-mode-hook 'custom-js2-mode-hook)

(provide 'elite-web)
