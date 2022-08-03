(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
         '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;(unless (package-installed-p 'spacemacs-theme)
;;  (package-refresh-contents)
;;  (package-install 'spacemacs-theme))

(unless (package-installed-p 'dracula-theme)
  (package-refresh-contents)
  (package-install 'dracula-theme))

;; Disable autosaving and temp file pollution
(setq make-backup-file nil)
(setq auto-save-default nil)

;; y or n instead of yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

;; ansi-term invocation QOL improvements
(defvar my-term-shell "bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

;; Example of a global keybind
;; (global-set-key (kbd "<s-return>") 'ansi-term)

;; Set the screen jump when scrolling
(setq scroll-conservatively 100)

;; Bell sound?
(setq ring-bell-function 'ignore)

;; Cursorline (only when using emacs in the GUI
(when window-system (global-hl-line-mode t))

;; Enables ligatures for special symbols like lambda
;;(when window-system (global-prettify-symbols-mode t))

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

;; tiny package that helps find the cursor when switching buffers
(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))

;; Evil Mode
(use-package evil
  :ensure t
  :init
  (evil-mode 1))

;; GUI view settings
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode 1)

(setq inhibit-startup-message nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("73803d7cebbc240fd6cd8a54077b8fbf0b263a25db48579f5953279986283481" "e5dc5b39fecbeeb027c13e8bfbf57a865be6e0ed703ac1ffa96476b62d1fae84" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#3a81c3")
     ("OKAY" . "#3a81c3")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#42ae2c")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(package-selected-packages
   '(dracula-theme beacon spacemacs-theme which-key use-package))
 '(pdf-view-midnight-colors '("#655370" . "#fbf8ef")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#292b2e" :foreground "#b2b2b2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :family "DinaRemasterII")))))
