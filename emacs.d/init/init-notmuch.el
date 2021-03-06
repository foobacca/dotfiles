(provide 'init-notmuch)

; notmuch related stuff
(add-to-list 'load-path "~/.linuxbrew/share/emacs/site-lisp")
(require 'notmuch)

; notmuch runs on a server, we use this script
(setq notmuch-command "~/bin/notmuch")

; bcc emails to self, as the emails live on a different machine
(setq notmuch-fcc-dirs nil)
(add-hook 'message-header-setup-hook
    (lambda () (insert (format "Bcc: %s <%s>\n"
                (notmuch-user-name)
                (notmuch-user-primary-email)))))

; address autocomplete
(require 'notmuch-address)
(setq notmuch-address-command "/home/hamish/bin/notmuch-abook-lookup")
(notmuch-address-message-insinuate)

; change colours a little
(setq notmuch-search-line-faces '(("unread" :weight bold)
                                  ("flagged" :foreground "green")))

(setq notmuch-saved-searches '((:name "inbox" :query "tag:inbox" :sort-order 'newest-first)
                               (:name "unreadinbox" :query "tag:inbox AND tag:unread" :sort-order 'newest-first)))

; message-mode stuff
;(setq message-send-mail-function 'message-send-mail-with-sendmail)
;(setq sendmail-program "/usr/sbin/sendmail")
;(setq sendmail-program "/home/hamish/bin/sendmail-ssh")
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "mail.linguamatics.com"
      smtpmail-smtp-server "mail.linguamatics.com"
      smtpmail-stream-type 'ssl
      smtpmail-smtp-service 587)
      ;smtpmail-smtp-service 465)
(setq message-from-style 'angles)

;(setq smtpmail-debug-info t)
;(setq smtpmail-debug-verb t)

; close the email compose buffer when we've sent it
(setq message-kill-buffer-on-exit t)
