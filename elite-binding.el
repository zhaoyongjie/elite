;; Common User Access (CUA) binding C-x, C-v, C-c, C-z:
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/CUA-Bindings.html#CUA-Bindings
;; (cua-mode t)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'text-scale-adjust)

(global-set-key (kbd "<C-M-right>") 'windmove-right)
(global-set-key (kbd "<C-M-left>") 'windmove-left)
(global-set-key (kbd "<C-M-down>") 'windmove-down)
(global-set-key (kbd "<C-M-up>") 'windmove-up)
(global-set-key (kbd "M-o") 'other-window)

;; join next line
(global-set-key (kbd "M-j") 'join-next-line)

(global-set-key (kbd "C-a") 'smart-beginning-of-line)

;; Duplicate region
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

;; Killing text
(global-set-key (kbd "C-w") 'kill-region-or-current-line)

;; Use M-w for save-line or save-region
(global-set-key (kbd "M-w") 'save-region-or-current-line)

;; calc-mode more comfortable
(global-set-key (kbd "M-c") 'quick-calc)

(provide 'elite-binding)
