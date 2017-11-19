(cua-mode 'on)
(setq cua-inhibit-cua-keys 't)
(invert-face 'default)
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq inhibit-splash-screen 't)
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-mode))

(add-hook 'c++-mode-hook
	  (lambda ()
	    (c-set-offset 'arglist-intro '+)
	    (c-set-offset 'arglist-close 0)))

(global-set-key (kbd "C-x g") 'magit-status)
(setq indent-tabs-mode 'nil)

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(add-hook 'after-init-hook 'global-company-mode)
(global-set-key [C-tab] 'company-complete)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(minimap-mode)
