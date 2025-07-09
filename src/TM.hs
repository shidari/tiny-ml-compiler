module TM
  ( D (..),
    S (..),
    Q (..),
    Delta,
    Program,
    Tape,
    p
  )
where

-- | 向き：次に見る方向
data D = R | L  -- R: 右へ、L: 左へ
  deriving (Eq, Show)

-- | テープ上の記号
data S = B | I | O  -- B: 空白、I: 入力1、O: 出力1（例）
  deriving (Eq, Show)

-- | 状態
data Q = M | H  -- M: 計算中、H: 停止
  deriving (Eq, Show)

-- | 遷移関数: ((現在状態, 現在記号), (次状態, 書き込む記号, 向き))
type Delta = [((Q, S), (Q, S, D))]

-- | プログラム = 開始状態 + 遷移関数
type Program = (Q, Delta)

-- | テープ = (左側, 現在のセル, 右側)
type Tape = ([S], S, [S])

-- | サンプルプログラム
-- 状態Mで:
--   Iを見たらOを書いて左へ、状態はMのまま
--   Oを見たらIを書いて左へ、状態はH（停止）へ
--   B（空白）を見たらIを書いて左へ、状態はH（停止）へ
p :: Program
p =
  ( M,
    [ ((M, I), (M, O, L))  -- I → O に書き換え、左へ、Mのまま
    , ((M, O), (H, I, L))  -- O → I に書き換え、左へ、停止
    , ((M, B), (H, I, L))  -- B → I に書き換え、左へ、停止
    ]
  )
