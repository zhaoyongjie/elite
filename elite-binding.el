;; Common User Access (CUA) binding C-x, C-v, C-c, C-z:
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/CUA-Bindings.html#CUA-Bindings
;; (cua-mode t)

(global-set-key (kbd "C-=") 'increase-emacs-font-size)
(global-set-key (kbd "C--") 'decrease-emacs-font-size)
(global-set-key (kbd "C-0") 'text-scale-adjust)

(global-set-key (kbd "<C-M-right>") 'windmove-right)
(global-set-key (kbd "<C-M-left>") 'windmove-left)
(global-set-key (kbd "<C-M-down>") 'windmove-down)
(global-set-key (kbd "<C-M-up>") 'windmove-up)
(global-set-key (kbd "M-o") 'rotate-frame-clockwise)
(global-set-key (kbd "M-O") 'rotate-frame-anticlockwise)

;; join next line
(global-set-key (kbd "M-j") 'join-next-line)

(global-set-key (kbd "C-a") 'smart-beginning-of-line)

;; Duplicate region
;; "C-c d" used by search bing dictionary
;; (global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)
(global-set-key (kbd "C-c w") 'copy-word)

;; Killing text
(global-set-key (kbd "C-w") 'kill-region-or-current-line)

;; Use M-w for save-line or save-region
(global-set-key (kbd "M-w") 'save-region-or-current-line)

;; Jump to a definition in the current file. (This is awesome)
(global-set-key (kbd "C-c i") 'ido-imenu)

;; calc-mode more comfortable
(global-set-key (kbd "M-c") 'quick-calc)

;; Like isearch, but adds region (if any) to history and deactivates mark
(global-set-key (kbd "C-s") 'isearch-forward-use-region)
(global-set-key (kbd "C-r") 'isearch-backward-use-region)

(global-set-key (kbd "M-s") 'highlight-regexp-use-region)
(global-set-key (kbd "M-S") 'unhighlight-regexp)

(global-set-key (kbd "C-c b") 'bookmark-set)
(global-set-key (kbd "C-c j") 'bookmark-jump)

;; magit series
(global-set-key (kbd "C-c s") 'magit-status)
(global-set-key (kbd "C-c l") 'magit-log-all)

;; hs-minor-mode
(global-set-key (kbd "C-c f") 'hs-toggle-hiding)

(global-set-key (kbd "M-d") 'delete-word)
(global-set-key (kbd "<M-backspace>") 'backward-delete-word)

(provide 'elite-binding)
