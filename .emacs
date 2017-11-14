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
