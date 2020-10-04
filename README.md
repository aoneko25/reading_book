# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|age|integer|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_one :profile, dependent: :destroy
- has_many :comments, dependent: :destroy

## booksテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|optional: true|
|item_id|integer|null: true, foreign_key: true|
|image|string|null: true|
|visibility(注目度)|string|null: true|
|genre(ジャンル)|string|null: true|
|title(タイトル)|string|null: true|
|subtitle(副題)|string|null: false|
|language(言語)|string|null: true|
|author(著者)|string|null: true|
|the_publisher(出版社)|string|null: true|
|issue_date(発行年月日)|date|null: true|
|page_number(ページ数)|integer|null: true|
|format(判型))|string|null: true|
|overview(概要)|text|null: true|
|chapter(章)|string|null: true|
|volume(巻数)|string|null: true|
|episode(話数)|string|null: true|
|read_day(読書日))|date|null: true|
|impression(感想)|text|null: true|

### Association
- belongs_to :user
- has_one :profile, dependent: :destroy
- has_many :comments, dependent: :destroy

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references| null: false, foreign_key: true|
|image|string|null: false|

### Association
- belong_to :profile
- belong_to :books

## profileテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|optional: true|
|self_introduction(自己紹介)|text|null: true|
|dream(夢)|string|null: true|
|terget(目標)|string|null: true|
|scheduled_date(予定日)|date|null: true|
|plan(予定)|string|null: true|
|favorite_book(好きな本)|string|null: true|
|hobby(趣味)|string|null: true|
|forte(得意なこと)|string|null: true|
|weak_point(苦手なこと)|string|null: true|
|icon|text||

### Association
- belongs_to : user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :user
- belongs_to :books