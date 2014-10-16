(require 'package)
(package-initialize)
(add-to-list 'package-archives
    '("marmalade" . "http://marmalade-repo.org/packages/") t)
;(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
    ;("marmalade" . "http://marmalade-repo.org/packages/")
    ;("melpa" . "http://melpa.milkbox.net/packages/")))

; Use this only when installing wiithout ELPA/el-get
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

; use the solarized theme
(load-theme 'solarized-dark t)

; notmuch related stuff
(autoload 'notmuch' "notmuch" "notmuch mail" t)
; notmuch runs on a server, we use this script
(setq notmuch-command "~/bin/remote-notmuch.sh")
; close the email compose buffer when we've sent it
(setq message-kill-buffer-on-exit t)

; message-mode stuff
;(setq message-send-mail-function 'message-send-mail-with-sendmail)
;(setq sendmail-program "/usr/sbin/sendmail")
;(setq sendmail-program "/home/hamish/bin/sendmail-ssh")
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "mail.aptivate.org" 465)
(setq message-from-style 'angles)

(server-start)
