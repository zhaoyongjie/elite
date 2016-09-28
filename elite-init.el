(defconst elite-install-dir
  (file-name-directory (or load-file-name
                           (when (boundp 'bytecomp-filename) bytecomp-filename)
                           buffer-file-name))
  "Installation directory of Elite"
)

(add-to-list 'load-path elite-install-dir)
;; http://stackoverflow.com/questions/1217180/how-do-i-byte-compile-everything-in-my-emacs-d-directory
;; (byte-recompile-directory (expand-file-name elite-install-dir) 0)

(require 'elite-setup)
(require 'elite-generic)
(require 'elite-web)
(require 'elite-python)

(provide 'elite-init)
