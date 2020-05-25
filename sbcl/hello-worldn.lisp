(defun printH (n)
(loop for i from 1 to n
    do (format t "Hello World~%"))
)
(setq n (read))
(printH n)
