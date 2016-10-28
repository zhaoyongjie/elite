(defun custom-org-mode-hook ()
  (setq org-src-fontify-natively t)
  )
(add-hook 'org-mode-hook 'custom-org-mode-hook)

(provide 'elite-org)
