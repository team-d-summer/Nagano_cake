# Nagano-cake ECサイト

長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト、をチーム開発演習で作成したもの。
 
 
# 概要

カリキュラムの中で提示された要件に基づき作成しました。
機能の要件をすべて満たすように作成してあります。
 
# 機能

## 顧客側機能 概要

顧客は非ログイン時でも商品を閲覧する事が出来ます。
また左側のジャンル一覧のジャンル名をクリックする事で、ジャンルごとに絞って商品を一覧表示させることも可能です。
ログインする事で顧客は商品をカートに入れる事が出来ます。
商品が入った状態のカートページから注文入力画面に移行し、必要な情報を入力する事で注文が完了できます。
また顧客は自身の会員情報を編集する事が可能です。退会する事も可能です。
退会すると、退会したアカウントではログインできなくなります。

## 管理者側機能

管理者機能は、管理者としてログインする事で使用する事が可能です。
管理者機能では、商品のジャンルの追加と編集、商品の追加と編集、会員情報の編集、注文状況の確認と注文ステータス・製作ステータスの変更が可能です。
顧客情報のページにある注文一覧ページへのリンクを押す事で、顧客ごとの注文一覧を表示する事が可能です。
一部注文ステータスと製作ステータスは連動しています。（詳細は下記の使い方より）

# 使い方
　ジャンル一覧から新しい商品ジャンルを追加し、それから管理者用の商品一覧ページにある「+ボタン」から商品を追加してください。
　注文された後、注文詳細ページから、注文ステータスを入金確認済にすることで、注文された状態の製作ステータスが製作待ちに変わります。
　注文された商品の製作ステータスを製作中に変える事で、注文ステータスが製作中に変わります。
　注文された商品の製作ステータスが全て製作完了に変わると、注文ステータスが発送準備中に変わります。
　商品を発送したら、製作ステータスを発送済みに変えてください。
　

# 使用したRailsとrubyのバージョン
Rails 6.1.7.3 　ruby 3.1.2p20
 
# 使用したプラグインやGem等
・ActiveStorage
・devise
・Bootstrap
・enum_help
・kaminari

# 作成
チーム：チームsummer
メンバー：えってぃ、ぐっち、じゃっきー、みかん
