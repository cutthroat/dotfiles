;; local packages
(add-to-list 'load-path "~/.elisp")

;; useful
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

;; general
(setq inhibit-splash-screen t)
(setq save-abbrevs nil)
(setq-default indent-tabs-mode nil)
(defalias 'yes-or-no-p 'y-or-n-p)

;; backup
(setq backup-inhibited t)

;; selection and parens
(setq transient-mark-mode t)
(delete-selection-mode t)
(global-font-lock-mode t)
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode t)

;; additional keys
(global-set-key (kbd "C-x C-b") 'bs-show) ; or ibuffer
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-m") 'indent-new-comment-line) ; or 'reindent-then-newline-and-indent)

;; interactively do things (insted of iswitchb-mode)
;(require 'ido)
;(ido-mode t)
;(setq ido-enable-flex-matching t)

;; fix dired
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            (setq dired-recursive-copies t)
            (setq dired-recursive-deletes t)
            (setq dired-dwim-target t)
            (setq dired-x-hands-off-my-keys nil)
            (setq dired-listing-switches (concat dired-listing-switches " --group-directories-first")) ; note --g-d-f does't work for ftp
            (setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.[^.].*$")
            (put 'dired-find-alternate-file 'disabled nil)
            ))
(add-hook 'dired-mode-hook
          (lambda ()
            (dired-omit-mode t)
            ))

;; fix comint based modes
(defun comint-erase-buffer () "Erase buffer of comint based modes"
  (interactive) (erase-buffer) (comint-send-input))
(add-hook 'comint-mode-hook
          '(lambda () (define-key comint-mode-map (kbd "C-l") 'comint-erase-buffer))) 

;; buffer commands
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max) nil))

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

;; visual
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(set-default-font "Terminus 12")

;; yeah!
;(server-mode 1)

;; pimp C mode
(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-style "k&r")
	    (c-set-offset 'arglist-cont '*)
            (c-set-offset 'arglist-cont-nonempty '*)
            (c-set-offset 'statement-cont '*)
            (setq c-basic-offset 8)
            ))

;; proof general
(load-file "~/.elisp/ProofGeneral/generic/proof-site.el")
