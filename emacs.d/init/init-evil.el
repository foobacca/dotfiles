(provide 'init-evil)

; Use this only when installing wiithout ELPA/el-get
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

; evil customisation
; - disable :q and :x
(evil-ex-define-cmd "q[uit]" nil)
(evil-ex-define-cmd "x" nil)

; the old Y change
(define-key evil-normal-state-map "Y" 'copy-to-end-of-line)

;;; esc ALWAYS quits

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'keyboard-quit)
