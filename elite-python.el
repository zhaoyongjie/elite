;; python
(defun custom-python-mode-hook ()
  (flycheck-mode t)
  (flycheck-select-checker 'python-flake8)
  (fci-mode t))
(add-hook 'python-mode-hook 'custom-python-mode-hook)

(provide 'elite-python)
