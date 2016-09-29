(global-set-key (kbd "<C-M-right>") 'windmove-right)
(global-set-key (kbd "<C-M-left>") 'windmove-left)
(global-set-key (kbd "<C-M-down>") 'windmove-down)
(global-set-key (kbd "<C-M-up>") 'windmove-up)
(global-set-key (kbd "M-o") 'other-window)

;; join next line
(global-set-key (kbd "M-j") (lambda ()
                              (interactive)
                              (join-line -1)))

(provide 'elite-binding)
