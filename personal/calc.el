(eval-after-load "calc-units"
  '(progn
     (setq math-additional-units
           '(
             (B "1" "Byte. Unit of information")
             (b "1/8 * B" "One bit of information.")
             (KB "1024 * B" "Kilobyte.")
             (MB "1024 * KB" "Megabyte.")
             (GB "1024 * MB" "Gigabyte.")
             (TB "1024 * GB" "Terrabyte.")
             (PB "1024 * TB" "Petabyte.")
             )
           math-units-table nil)))
