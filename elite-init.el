(defconst elite-install-dir
  (file-name-directory (or load-file-name
                           (when (boundp 'bytecomp-filename) bytecomp-filename)
                           buffer-file-name))
  "Installation directory of Elite"
)

(add-to-list 'load-path elite-install-dir)

(require 'elite-setup)
(require 'elite-generic)
(require 'elite-web)
(require 'elite-python)

(provide 'elite-init)
