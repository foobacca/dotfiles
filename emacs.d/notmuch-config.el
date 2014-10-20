;(setq notmuch-command "/home/hamish/bin/notmuch")

(define-key notmuch-show-mode-map "b"
      (lambda (&optional address)
        "Bounce the current message."
        (interactive "sBounce To: ")
        (notmuch-show-view-raw-message)
        (message-resend address)))

(define-key notmuch-search-mode-map "k" 'notmuch-search-previous-thread)
(define-key notmuch-search-mode-map "j" 'notmuch-search-next-thread)
