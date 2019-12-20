;; print_preview is a custom script in ~/bin
;; ```
;; #!/bin/bash
;;
;; mkdir -p ~/tmp
;; PREVIEW_FILE="$HOME/tmp/print_preview.ps"
;; PREVIEW_FILE_PDF="$HOME/tmp/print_preview.pdf"
;;
;; rm "$PREVIEW_FILE"
;; rm "$PREVIEW_FILE_PDF"
;;
;; cat  > "$PREVIEW_FILE" && \
;;   gs -sOutputFile="$PREVIEW_FILE_PDF" -dNOPAUSE -dBATCH -sPAPERSIZE=a4 -sDEVICE=pdfwrite -dSAFER "$PREVIEW_FILE" > /dev/null && \
;;   open "$PREVIEW_FILE_PDF"
;; ```

(setq ps-lpr-command "print_preview")

(defun hh-print ()
  (interactive)
  (let  ((ps-paper-type 'a4)
         (ps-landscape-mode    nil)
         (ps-number-of-columns 1)

         (ps-left-margin   (/ (* 72  1.0) 2.54)) ; 1cm
         (ps-right-margin  (/ (* 72  1.0) 2.54)) ; 1cm
         (ps-inter-column  (/ (* 72  1.0) 2.54)) ; 1cm
         (ps-bottom-margin (/ (* 72  1.5) 2.54)) ; 1cm
         (ps-top-margin    (/ (* 72  1.5) 2.54)) ; 1cm
         (ps-header-offset (/ (* 72  1.0) 2.54)) ; 1cm
         (ps-header-line-pad    .15)
         (ps-print-header       t)
         (ps-print-header-frame t)
         (ps-header-lines       1)
         (ps-show-n-of-n        t)
         (ps-spool-duplex       t)

         (ps-font-family             'Courier)
         (ps-font-size 7)
         (ps-header-font-family      'Courier)
         (ps-header-font-size        7)
         (ps-header-title-font-size  7))
    (ps-print-buffer-with-faces)))
