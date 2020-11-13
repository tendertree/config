(use-package gruvbox-theme :ensure t
:init
(custom-set-variables
 '(custom-enabled-themes '(gruvbox-dark-hard))
 '(custom-safe-themes
   '("4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" default))
 '(package-selected-packages '(gruvbox-theme use-package)))
(custom-set-faces
 )
 )
;;smart mode line
(use-package smart-mode-line :ensure t
:init 
(sml/setup)
)