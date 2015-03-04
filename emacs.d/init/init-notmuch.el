(provide 'init-notmuch)

; notmuch related stuff
(autoload 'notmuch' "notmuch" "notmuch mail" t)

; notmuch runs on a server, we use this script
(setq notmuch-command "~/bin/remote-notmuch.sh")

; bcc emails to self, as the emails live on a different machine
(setq notmuch-fcc-dirs nil)
(add-hook 'message-header-setup-hook
    (lambda () (insert (format "Bcc: %s <%s>\n"
                (notmuch-user-name)
                (notmuch-user-primary-email)))))

; use 'b' to bounce messages
(define-key notmuch-show-mode-map "b"
    (lambda (&optional address)
        "Bounce the current message."
        (interactive "sBounce To: ")
        (notmuch-show-view-raw-message)
        (message-resend address)))

; address autocomplete
(require 'notmuch-address)
(setq notmuch-address-command "/home/hamish/bin/notmuch-abook-lookup")
(notmuch-address-message-insinuate)

; change colours a little
(setq notmuch-search-line-faces '(("unread" :weight bold)
                                  ("flagged" :foreground "green")))

(setq notmuch-saved-searches '((:name "inbox" :query "tag:inbox AND NOT tag:killed AND NOT tag:deleted" :sort-order 'newest-first)
                               (:name "unreadinbox" :query "tag:inbox AND tag:unread" :sort-order 'newest-first)
                               (:name "nagios" :query "tag:nagios" :sort-order 'newest-first)
                               (:name "carers" :query "tag:carers AND NOT tag:logwatch" :sort-order 'newest-first)))

; message-mode stuff
;(setq message-send-mail-function 'message-send-mail-with-sendmail)
;(setq sendmail-program "/usr/sbin/sendmail")
;(setq sendmail-program "/home/hamish/bin/sendmail-ssh")
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "mail.aptivate.org"
      smtpmail-smtp-server "mail.aptivate.org"
      smtpmail-stream-type 'ssl
      ;smtpmail-smtp-service 587)
      smtpmail-smtp-service 465)
(setq message-from-style 'angles)

;(setq smtpmail-debug-info t)
;(setq smtpmail-debug-verb t)

; close the email compose buffer when we've sent it
(setq message-kill-buffer-on-exit t)

