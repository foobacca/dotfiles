(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)
(add-to-list 'package-archives
    '("marmalade" . "http://marmalade-repo.org/packages/") t)
;(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
    ;("marmalade" . "http://marmalade-repo.org/packages/")
    ;("melpa" . "http://melpa.milkbox.net/packages/")))

; use files from brew emacs install
(let ((default-directory "/opt/hamish/.linuxbrew/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

; don't show the start up screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(tool-bar-mode -1)

; use the solarized theme
(load-theme 'solarized-dark t)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/init"))

(mapc 'require '(init-evil
                 init-ido
                 init-org
                 init-notmuch
                ))

;(server-start)
(require 'server)
(unless (server-running-p)
    (server-start))
