;; 
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives 
             '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar install-packages '(js2-mode
                           web-mode
                           json-mode
                           nginx-mode
                           flycheck
                           )
  "A list of packages to ensure are installed at launch.")
(dolist (p install-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;
(dolist (relpath '(""
                   "extensions/"
                   "extensions/auto-complete"
                   )
                 )
  (add-to-list 'load-path (concat elite-install-dir relpath)))

(provide 'elite-setup)
