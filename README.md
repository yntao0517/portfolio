#Coid

コロナウイルスで病院で不足している品物一覧を表示し、
病院と物資支援してくれる企業、個人を結ぶ物資支援サービス

#概要
病院でコロナウイルス感染者に配ってあげるなどの用途があります。

#開発環境
Ruby 2.6.3
Rails 6.0.3.2

#使用技術
HTML, CSS, Javascript, Ruby, Ruby on Rails, Bootstrap, RSpec, Rubocop, Docker, CircleCI, Heroku

#API
楽天API
PAY.JP API

#データベース構成
##病院
名前、メールアドレス、住所、電話番号、代表者名、password_digest, remember_digest, id

##寄付者
名前、メールアドレス、住所、電話番号、password_digest, remember_digest, id

##hospital_items
病院idとitemid

##user_items
ユーザーidとhospital_item_id

##items
id, price, image_url, item_code, item_url

#開発手順
Ruby(Rails)で動いているので、  Rubyが書ける環境にしておいてください。
RubyのGemをいれて bundle install してください。
まずは 楽天APIアプリ登録 からアプリIDを取得してください。*楽天IDが必須です。
取得できたら、config/initializers/rakuten.rb に APPLICATION_IDを設定します。
これで準備完了です。
また、PAY.JPも使うので、必要なときに秘密鍵と公開鍵の取得をしてください。

