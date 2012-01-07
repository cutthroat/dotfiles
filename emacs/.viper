(setq viper-syntax-preference 'extended)
(setq-default viper-auto-indent t)
(setq viper-ex-style-motion nil)
(setq viper-ex-style-editing nil)
(setq viper-inhibit-startup-message t)
(setq viper-want-ctl-h-help t)
(setq viper-expert-level 5)

;(viper-buffer-search-enable) ; g <motion> then n

(define-key viper-vi-global-user-map (kbd "gf")  'find-file-at-point)
(define-key viper-vi-global-user-map (kbd "gg")  'viper-goto-first-line)
(define-key viper-vi-global-user-map (kbd "*")   'viper-search-forward-for-symbol-at-point)
(define-key viper-vi-global-user-map (kbd "#")   'viper-search-backward-for-symbol-at-point)
(define-key viper-vi-global-user-map (kbd "C-]") 'viper-jump-to-tag-at-point)
(define-key viper-vi-global-user-map (kbd "C-t") 'pop-tag-mark)
(define-key viper-vi-global-user-map (kbd "TAB") 'bs-show)

(add-to-list 'viper-major-mode-modifier-list '(inferior-python-mode insert-state viper-comint-mode-modifier-map))
(add-to-list 'viper-major-mode-modifier-list '(inferior-python-mode vi-state viper-comint-mode-modifier-map))

(defvar viper-python-mode-modifier-map (make-sparse-keymap) "Fix viper shadowing python-mode")
(define-key viper-python-mode-modifier-map (kbd "<backspace>") 'viper-exec-key-in-emacs)
(add-to-list 'viper-major-mode-modifier-list '(python-mode insert-state viper-python-mode-modifier-map))
(add-to-list 'viper-major-mode-modifier-list '(python-mode vi-state viper-python-mode-modifier-map))


;; modded from vimlike.el
(defun viper-jump-to-tag-at-point ()
  (interactive)
  (let ((tag (thing-at-point 'symbol)))
    (find-tag tag)))

(defun viper-goto-first-line ()
  (interactive)
  (viper-goto-line 1)) 

(defun viper-search-for-symbol-at-point (forward)
  (let ((symbol (thing-at-point 'symbol)))
    (setq viper-s-string symbol)
    (setq viper-s-forward forward)
    (viper-search symbol forward 1))) 

(defun viper-search-forward-for-symbol-at-point ()
  (interactive)
  (viper-search-for-symbol-at-point t))

(defun viper-search-backward-for-symbol-at-point ()
  (interactive)
  (viper-search-for-symbol-at-point nil))
