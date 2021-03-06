(set-logic QF_BV)
(set-info :status sat)
(declare-fun X5 () (_ BitVec 1))
(declare-fun X2 () (_ BitVec 64))
(declare-fun X3 () (_ BitVec 1))
(declare-fun X4 () (_ BitVec 1))
(declare-fun X6 () (_ BitVec 1))
(declare-fun X7 () (_ BitVec 1))

(assert (= (= X3 (_ bv1 1)) (distinct X2 ((_ extract 63 0) (_ bv0 64)))))
(assert (= X4 (bvand X5 X3)))
(assert (= (= X7 (_ bv1 1)) (=> (= X4 (_ bv1 1)) (= X6 (_ bv1 1)))))
(assert (= true (= ((_ extract 0 0) (_ bv0 64)) X7)))
(check-sat)
(exit)
