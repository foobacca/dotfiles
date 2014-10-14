(setq notmuch-command "/home/hamish/bin/notmuch")

; bcc emails to self, as the emails live on a different machine
(setq notmuch-fcc-dirs nil)
(add-hook 'message-header-setup-nook
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
