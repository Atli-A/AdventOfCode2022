

(defun main (filename)
  (let ((file (open filename)) (line nil) (sum 0) (max-sum 0))
    (loop do (setq line (read-line file nil))
      when (not line) return nil
      do (if (string= line "")
           (progn
             (if (> sum max-sum) (setq max-sum sum))
             (setq sum 0))
           (setq sum (+ sum (parse-integer line)))))
    (close file)
    max-sum))

(format T "~d~%" (main "input"))
(quit)
