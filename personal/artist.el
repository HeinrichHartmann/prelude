(add-hook 'artist-mode-hook
          (lambda ()
            (local-set-key (kbd "<f2>") 'artist-select-op-pen-line) ; f2 = pen mode
            (local-set-key (kbd "<f3>") 'artist-select-op-line)     ; f3 = line
            (local-set-key (kbd "<f4>") 'artist-select-op-square)   ; f4 = rectangle
            (local-set-key (kbd "<f5>") 'artist-select-op-ellipse)  ; f5 = ellipse
            ))
