(defun custom-org-mode-hook ()
  (setq truncate-lines nil)
  )
(add-hook 'org-mode-hook 'custom-org-mode-hook)

(provide 'elite-org)
