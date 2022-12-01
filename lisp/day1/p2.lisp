(defun replace-if-bigger-once (arr num)
  (let ((lowest (aref arr 0)) (lowest-pos 0) (cur nil))
    (loop for i from 0 to (1- (length arr))
      do (setq cur (aref arr i))
      when (< cur lowest)
      do (setq lowest cur) (setq lowest-pos i))
    (if (> num lowest)
      (setf (aref arr lowest-pos) num))
    arr))

(defun main (filename)
  (let (
        (file (open filename)) 
        (line nil) 
        (sum 0) 
        (max-sums (make-array 3 :initial-element 0)))
    (loop do (setq line (read-line file nil))
      when (not line) return nil
      do (if (string= line "")
           (progn 
             (setq max-sums (replace-if-bigger-once max-sums sum))
             (setq sum 0))
           (setq sum (+ sum (parse-integer line)))))
    (close file)
    (eval `(+ ,@(loop for i across max-sums collect i)))))

(format T "~d~%" (main "input"))
(quit)
