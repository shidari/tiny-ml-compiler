module Eval
  ( move
  )
where

import TM

move :: TM.D -> TM.Tape -> TM.Tape
move TM.L ([], h, rs)      = ([], TM.B, h:rs)
move TM.L (l:ls, h, rs)    = (ls, l, h:rs)
move TM.R (ls, h, [])      = (h:ls, TM.B, [])
move TM.R (ls, h, r:rs)    = (h:ls, r, rs)

-- eval, exec などは未実装のままコメントアウト
-- eval :: TM.Program -> TM.Tape -> TM.Tape
-- exec :: TM.Delta -> (TM.Q, TM.Tape) -> TM.Tape