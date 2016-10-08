(defun eshell/clear ()
  ;; clear buffer.
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defun eshell/e (&rest args)
  ;; Open a file in emacs.
  (if (null args)
      (bury-buffer)
    (mapc #'find-file
          (mapcar #'expand-file-name
                  (eshell-flatten-list (reverse args))))))

(defun custom-eshell-mode-hook ()
  (setq eshell-aliases-file "eshell.alias")
  (setq eshell-history-size 1024)
  ;; http://stackoverflow.com/questions/19831228/make-eshell-tab-completion-behaves-like-bash
  ;; Make eshell tab completion behaves like Bash
  (setq pcomplete-cycle-completions nil)
  (linum-mode -1)
  (setq show-trailing-whitespace nil)
  )

(add-hook 'eshell-mode-hook 'custom-eshell-mode-hook)

;; ac for eshell
(defvar ac-source-eshell-pcomplete
  '((candidates . (pcomplete-completions))))
(defun ac-complete-eshell-pcomplete ()
  (interactive)
  (auto-complete '(ac-source-eshell-pcomplete)))
(add-to-list 'ac-modes 'eshell-mode)
(setq ac-sources '(ac-source-eshell-pcomplete
                   ac-source-files-in-current-dir
                   ac-source-filename
                   ;; ac-source-abbrev
                   ;; ac-source-words-in-buffer
                   ;; ac-source-imenu
                   ))

(provide 'elite-eshell)
