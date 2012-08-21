;; local packages
(add-to-list 'load-path "~/.elisp")

;; useful
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(display-time-mode t)
(column-number-mode t)
(set-fill-column 80)

;; general
(setq inhibit-splash-screen t)
(setq save-abbrevs nil)
(setq-default indent-tabs-mode nil)
(defalias 'yes-or-no-p 'y-or-n-p)

;; no backup
(setq backup-inhibited t)

;; selection and parens
(setq transient-mark-mode t)
(delete-selection-mode t)
(global-font-lock-mode t)
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode t)

;; interactively do things (vs iswitchb-mode)
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; additional keys
(global-set-key (kbd "RET") 'newline-and-indent) ; 'reindent-then-newline-and-indent)
(global-set-key (kbd "<f3>") 'ido-find-file)
(global-set-key (kbd "<f4>") 'ido-switch-buffer)
(global-set-key (kbd "<f5>") 'bs-show) ; or ibuffer
(global-set-key (kbd "<f9>") 'recompile)
(global-set-key (kbd "<f10>") 'magit-status)

;; fix dired
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            (setq dired-recursive-copies t)
            (setq dired-recursive-deletes t)
            (setq dired-dwim-target t)
            (setq dired-x-hands-off-my-keys nil)
            (setq dired-listing-switches
                  (concat dired-listing-switches " --group-directories-first")) ; note --g-d-f does't work for ftp
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
(set-default-font "Terminus-10")

(add-to-list 'load-path "~/.elisp/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-charcoal-black) ; other nice themes are clarity, blue-sea and less

;; yeah!
;(server-mode 1)

;; pimp C mode
(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-style "linux")
            ;(c-set-offset 'arglist-cont '*)
            ;(c-set-offset 'arglist-cont-nonempty '*)
            ;(c-set-offset 'statement-cont '*)
            ;(setq c-basic-offset 8)
	    (setq indent-tabs-mode t)
            ))

;; proof general
;(load-file "~/.elisp/ProofGeneral/generic/proof-site.el")

;; magit
(add-to-list 'load-path "~/.elisp/magit")
(require 'magit)

;; haskell
(load "~/.elisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook
          (lambda ()
            (turn-on-haskell-indent)
            ))

;; eeeevil!
(add-to-list 'load-path "~/.elisp/evil")
(require 'evil)
(evil-mode t)

(define-key evil-normal-state-map (kbd "\]") 'next-buffer)
(define-key evil-normal-state-map (kbd "\[") 'previous-buffer)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-a") 'universal-argument)

(evil-define-key 'normal bs-mode-map (kbd "RET") 'bs-select)
(evil-define-key 'normal bs-mode-map (kbd "d") 'bs-delete)

(evil-ex-define-cmd "cn[ext]" 'next-error)
(evil-ex-define-cmd "cp[revious]" 'previous-error)

(defun swap-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer))
  )
