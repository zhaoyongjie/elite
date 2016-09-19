;; python
(defun custom-python-mode-hook ()
  (flycheck-mode t)
  (flycheck-select-checker 'python-pylint)
  (fci-mode t))
(add-hook 'python-mode-hook 'custom-python-mode-hook)

(provide 'elite-python)
