(defun eshell/clear ()
  "clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defun eshell/e (&rest args)
  "Open a file in emacs. Some habits die hard."
  (if (null args)
      ;; If I just ran "emacs", I probably expect to be launching
      ;; Emacs, which is rather silly since I'm already in Emacs.
      ;; So just pretend to do what I ask.
      (bury-buffer)
    ;; We have to expand the file names or else naming a directory in an
    ;; argument causes later arguments to be looked for in that directory,
    ;; not the starting directory
    (mapc #'find-file
          (mapcar #'expand-file-name
                  (eshell-flatten-list (reverse args))))))

;; eshell
(defun custom-eshell-mode-hook ()
  (if (file-exists-p "~/.shells/.bashrc") nil)
  (setq eshell-aliases-file "eshell.alias")
  (setq eshell-history-size 1024)
  ;; http://stackoverflow.com/questions/19831228/make-eshell-tab-completion-behaves-like-bash
  ;; Make eshell tab completion behaves like Bash
  (setq pcomplete-cycle-completions nil)
  (linum-mode -1)
  
  (defvar ac-source-eshell-pcomplete
    '((candidates . (pcomplete-completions))))
  (defun ac-complete-eshell-pcomplete ()
    (interactive)
    (auto-complete '(ac-source-eshell-pcomplete)))
  (add-to-list 'ac-modes 'eshell-mode)
  (setq ac-sources '(ac-source-eshell-pcomplete
                     ac-source-files-in-current-dir
                     ;; ac-source-filename
                     ;; ac-source-abbrev
                     ;; ac-source-words-in-buffer
                     ;; ac-source-imenu
                     ))
  )

(add-hook 'eshell-mode-hook 'custom-eshell-mode-hook)

(provide 'elite-eshell)
