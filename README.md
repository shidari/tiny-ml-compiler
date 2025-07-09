# Tiny ML Compiler

チューリングマシンのコンパイラプロジェクトです。Haskellで実装されています。

## 機能

- チューリングマシンのデータ型定義（状態、記号、向き）
- テープ操作（移動、読み書き）
- プログラム実行エンジン
- テストフレームワーク（Hspec + QuickCheck）

## セットアップ

```bash
# 依存関係のインストール
stack build

# テストの実行
stack test
```

## テストの追加例

```haskell
-- test/Spec.hs に新しいテストを追加
describe "My custom program" $ do
  it "should transform input correctly" $ do
    runMyProgram "1" `shouldBe` "2"
    runMyProgram "2" `shouldBe` "1"
```

## プロジェクト構造

- `src/TM.hs` - チューリングマシンのデータ型定義
- `src/Eval.hs` - プログラム実行エンジン
- `src/Lib.hs` - ユーティリティ関数
- `test/Spec.hs` - テストスイート

## データ型

- `D` - 向き（R: 右、L: 左）
- `S` - 記号（B: 空白、I: 入力1、O: 出力1）
- `Q` - 状態（M: 計算中、H: 停止）
- `Tape` - テープ（左側、現在位置、右側）
- `Program` - プログラム（開始状態、遷移関数）
