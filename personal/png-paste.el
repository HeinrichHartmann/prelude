;;; png-paste.el --- Paste png images

;; Copyright (C) 2019  Heinrich Hartmann

;; Author: Heinrich Hartmann <hartmann@HHMB>
;; Keywords: 

;;; Commentary:

;; 

;;; Code:

(eval-when-compile (require 'cl-lib))

(defvar png-asset-directory "/tmp" "Directory to save pasted png files to.")

(defvar png-asset-prefix "image_" "Prefix to apply to all pasted png files.")

(defvar png-paste-template "![]($filename)")

(defun png-paste (filename)
  (with-output-to-string
    (message (format "png-paste to %s" filename))
    (call-process "pngpaste" nil standard-output "pngpaste" filename)))

(defun png-preview (filename)
  (with-current-buffer (get-buffer-create "*preview*")
    (erase-buffer)
    (display-buffer "*preview*")
    (insert-image (create-image filename))))

(defun png-insert-template (filename)
  (insert (replace-regexp-in-string "\$filename" filename png-paste-template)))

(defun png-insert (filename)
  "paste image into directory with given prefix"
  (interactive "sFilename: ")

  ;; default filename:
  ;; (format %s%04x%04x%04x png-asset-prefix (random 65536) (random 65536) (random 65536))

  (cl-assert (file-directory-p png-asset-directory) nil
             "Directory not found %s" png-asset-directory)

  ;; generate random filename
  (let* ((fullfilename (format "%s.png"  filename))
        (path (concat png-asset-directory "/" fullfilename)))

    ;; assert, that we generated a new filename
    ;; (cl-assert (not (file-exists-p path)) nil "Filename already taken")

    (message (png-paste path))
    (png-preview path)
    (png-insert-template fullfilename)))

(provide 'png-paste)
;;; png-paste.el ends here

;; Local Variables:
;; flycheck-disabled-checkers: (emacs-lisp-checkdoc)
;; End:
