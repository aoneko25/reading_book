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
|issue_date(発行年月日)|string|null: true|
|page_number(ページ数)|integer|null: true|
|format(判型))|string|null: true|
|overview(概要)|text|null: true|
|chapter(章)|string|null: true|
|volume(巻数)|string|null: true|
|episode(話数)|string|null: true|
|read_day(読書日))|text|null: true|
|impression(感想)|text|null: true|

### Association
- belongs_to :user
- has_one :profile, dependent: :destroy
- has_many :comments, dependent: :destroy

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer| null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :books

## profileテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|optional: true|
|profile|text|null: true|
|icon|text||

### Association
- belongs_to : user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :user
- belongs_to :books