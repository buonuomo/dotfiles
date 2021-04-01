(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(add-to-list 'load-path "~/.emacs.d/linum-highlight-current-line-number")

; Allow gui to pick up on environment vars
(exec-path-from-shell-initialize)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)

; Go to scratch buffer on startup
(setq inhibit-startup-message t)

; Set 

; (fringe-mode '(4 . 6))

; autocompletion
(ac-config-default)
(setq ac-auto-show-menu 0)

;; Set default font
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 110
                    :weight 'normal
                    :width 'normal)
;; Set font for gui
; (set-frame-font "DejaVu Sans Mono 10")
(add-to-list 'default-frame-alist '(height . 24))
(tool-bar-mode -1)
(scroll-bar-mode -1)

;(add-hook 'evil-insert-state-entry-hook
;  (lambda () (when (eq 'agda2-mode (buffer-local-value 'major-mode (current-buffer)))
;    (set-input-method "Agda"))))

; Allow jk to exit insert mode
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

; (require 'agda2-mode)
(add-hook 'agda2-mode-hook
  '(lambda ()
     (define-key agda2-mode-map (kbd "C-c ,") 'agda2-goal-and-context)
     (define-key agda2-mode-map (kbd "C-c .") 'agda2-goal-and-context-and-inferred)
     (define-key agda2-mode-map (kbd "C-c =") 'agda2-show-constraints)
     (define-key agda2-mode-map (kbd "C-c ?") 'agda2-show-goals)))

;; Open .v files with Proof-General's coq-mode
(require 'proof-site "~/.emacs.d/lisp/PG/generic/proof-site")

;; Load company-coq when opening Coq files
(add-hook 'coq-mode-hook #'company-coq-mode)
(setq company-coq-features/prettify-symbols-in-terminals t)

; Show cursorline
(global-hl-line-mode +1)


; line numbers
(global-linum-mode 1)

(require 'linum-highlight-current-line-number)
(setq linum-format 'linum-highlight-current-line-number)

;(setq linum-format "%d ")

; Load my custom colorscheme
(if (display-graphic-p)
    (load-theme 'noah-custom-gui t)
  (load-theme 'noah-custom t))

(add-hook 'evil-insert-state-exit-hook (lambda () (set-input-method nil)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("cf71154b90a9516581049bc64ef35bdd36e53f6bfefe9a677406b6c954f085b5" "f269364641e99349c4702cdfdfcfed0a0a69dfc7ce27860d85ad2850d3b8fcdc" "c0d65cb1908b5fc232ef0e5b19adf0a5d0500b630a53605624c074ffaea32c21" "4d4bc57ba8ee78ef5254abbc9afa05aeda3dadd3e9281eae1fdcea1491e3de24" "aa7ae1a38a9e627bf3fbcd49f9b0356cb7bff936d37c1f80101e1183467200ae" "90a486c0f2af0f53e3636c3d2b0ceea8316d8e112201d2b3f6bcb06b07cf0e00" "71eb03c3ab3c0e75eb5a8308fd5c5bd01b1dda8fbcf35588003affb327f8d43a" "7f7ec6b452d357b8f18f66b36fc3ae7f7587bf96ebd0523034ffd71b2d512a1c" "090e4cfec6ffb3b8622ab387ffc6b6d517fbf22bb032e741e5ceaecbb3d4bd35" "3798601a8c50c7e2869370a916f94655cb95f8166c0a8cba0a7226886faebf66" "a4a254fd0785019dc9ef7e4c80d302f1069a99739640d1fecf4481089d52703e" "a6b80889906416cf8c19b672f5c68e1b9e31a71abfff98ea78cd0ccb92eca847" "50d81ee66631fe6c5fd7c8d8fc975c23d91031183eb8aa7055dd80dfbfd598ab" "9454ccd88e56a2dc666292962828ba223254a55d178808a165e2ecca10733538" "aad90862c06070ccbfc6f8f109c788bfb21587d46b1ff6bc78122665c40a8642" "d98f84cc90404b1eb8008628575d7bbe74cd015e7fe0e181047b836d6567758d" "a2256beb6067040abd6c7d03b67a3a9b92c51318bd169d15f64ab7f93c0f57b7" "75a5ab11aed11af838119eda3d175d6d0e817d0629c618a80c1a43357ebff341" "44cbf0141a3c3d20a9bec26f771852aae2743a249b791ced91075097baf0a351" "51f834c5659dc725ee8147fa71fe5021dca03ab8839416298f4ea71e1b9a3095" "37e0d1838f12b9698853636aee3d6716082918d8ff855ece898d2982d960e187" "e80031e56262958ed7e909ed82d1d670877ce9b3e2b36375a4d3d47b8be640d5" "33c534c449a9e053728c19e73ae18f9040492c31369fba7beb73211307a9b4af" "a8b3707c5a64e1e7f67bd12d14a771e063118d31c64b8a3d6383c567f53e5ad5" "7e1870a37cfbfa5ac23d8a1f6afb1fbca0f6d9ced13f34e2960589144a150dd3" "c3d66103113e56f990395f17c1c983f3b03ac2f603cd9298186f29b3d166b4b5" "323c113d3d85d4bfd4619956be9fbd133ff90ed902daa8712d72698504d68e65" "57af88f37f4f04b7aa5299b27cf1b8551e05fe6401ca91020b319362854d3df1" "d2ecd9fdba71f6219ccdf1e466f3a9bcfc2847fb863afa606256e7d742fca56f" "6f4d7bb003dad9ca0d26d3a09da3348663398dc18fadd2584790c5651b941127" "c3795926f5aadffc65eb627405baf6b0dd7df99a331121876c945c2a1d8501c4" "80f2c14810b31eea46b1c43d139e91588208c853b3f8db5b7c959df52f327628" "fae9c8162df7c14b3379e648b06994f75f11cbe7122640c9b9dca88f9e0d682d" "3140af8a4223819e12a80143d730e7317688a296a28c43ddd0a1a8e899bfbf9e" "03cb88d582ddcee6d94930dc376164df4c5d4d3e5ff655bdda8246c42f812d47" "7141075863841667bc9093010e63170bab800af2e0fd9f56a15f9e199089cb10" "5500d7249627902a4ce4e2009f7192601676451f8b951fe4306d2e98ca818d81" "64e5f55ba124c0ac3f0aedbd2a788f127f83b0a36f6deb6be7ffea1c1979dd35" "790c9c0aaef0a3bfeb1030ea224b274eb7eec880d3b1e67cf36850714e9513ad" "a9d1e0ed86f768fcc5d2c17ea5a0626fcd83030d4ab27752270412158ccc3cbc" "a4a3bb36906947fd3228750679068dba99664e81cf358c6cfdc7c173306ca082" "de6b1df754ae7e88c631eda570c007c3359cfe0e65111e65edc04af6eb30379c" "0f79b1e64ba22cae2c8bdd7c6509945a5d5bd9da27458d070728aacd3ab9b4bd" "7b563a33526583e8060124f09039a2560950b0e5b4eb209637af75faf4e0d878" "44d8334d4a639549c93683492e8e6e1c508f18968350709b4ecdee35ec14b333" "8a5efd2e5eae922c6bc226c680451ee1aa22e3fe19d591e796a4b9b3b50aa356" "af4410b32dd6d79108790c392415bf69dc7f0bbe0c7380205aa35a96183e4d5b" "d3f44786a8c259f398294edb6e6245c69c7f824917d5570ed0fd2e946131dd63" "62205b4a7223a4a48f3f763f3953e773a12cbe75ea9a621e01bef44aee3ecee5" "662d2f176e499a620df7d14949b0a93dd973f723a9350d98542a112ddeca3fc6" "dce30686a069099dc773a8e98e7c90b7c396a66954e0700ec041aea3d2eebe6d" "fc2d1b575ec6ab029ca5c1adb897fec8d8f1fdbdb88322aa9034f7b9e447c3b9" "1c54b5db5d6f9a73301d694dfd4bd1cca473e505fff50feed7cc8bbd1567538f" "5fe37195baeebef1741a5268ad4969fe78317d9885a306cf64f92d081325cddf" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "880f541eabc8c272d88e6a1d8917fe743552f17cedd8f138fe85987ee036ad08" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "e26e879d250140e0d4c4d5ab457c32bcb29742599bd28c1ce31301344c6f2a11" "45482e7ddf47ab1f30fe05f75e5f2d2118635f5797687e88571842ff6f18b4d5" "011d4421eedbf1a871d1a1b3a4d61f4d0a2be516d4c94e111dfbdc121da0b043" "0973b33d2f15e6eaf88400eee3dc8357ad8ae83d2ca43c125339b25850773a70" "abd7719fd9255fcd64f631664390e2eb89768a290ee082a9f0520c5f12a660a8" "daeaa8249f0c275de9e32ed822e82ff40457dabe07347fe06afc67d962a3b1e9" "a5a2954608aac5c4dcf9659c07132eaf0da25a8f298498a7eacf97e2adb71765" "db510eb70cf96e3dbd48f5d24de12b03db30674ea0853f06074d4ccf7403d7d3" "6213a6047cc19f580c37ef3f6d47fd5a55ebdf9b5590475d8f7a6aecd79a1cc0" "cdc2a7ba4ecf0910f13ba207cce7080b58d9ed2234032113b8846a4e44597e41" "2047464bf6781156ebdac9e38a17b97bd2594b39cfeaab561afffcbbe19314e2" default)))
 '(package-selected-packages
   (quote
    (auto-complete exec-path-from-shell company-coq proof-general highlight-numbers paren-face haskell-mode solarized-theme color-theme-modern key-chord gnu-elpa-keyring-update evil)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

