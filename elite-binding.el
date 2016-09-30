;; Common User Access (CUA) binding C-x, C-v, C-c, C-z:
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/CUA-Bindings.html#CUA-Bindings
(cua-mode t)

;; calc-mode more comfortable
(global-set-key (kbd "M-c") 'calc-dispatch)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'text-scale-adjust)

(global-set-key (kbd "<C-M-right>") 'windmove-right)
(global-set-key (kbd "<C-M-left>") 'windmove-left)
(global-set-key (kbd "<C-M-down>") 'windmove-down)
(global-set-key (kbd "<C-M-up>") 'windmove-up)
(global-set-key (kbd "M-o") 'other-window)

;; join next line
(global-set-key (kbd "M-j") (lambda ()
                              (interactive)
                              (join-line -1)))

;; Move point to first non-whitespace character or beginning-of-line.
;; Move point to the first non-whitespace character on this line.
;; If point was already at that position, move point to beginning of line.
(defun smart-beginning-of-line ()
  (interactive)
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))
(global-set-key "\C-a" 'smart-beginning-of-line)

;; calc-mode
(global-set-key (kbd "M-c") 'calc-dispatch)

(provide 'elite-binding)
