= Redditor

This project rocks and uses MIT-LICENSE.

## Badges
[![Build Status](https://secure.travis-ci.org/redde/redditor.png)](http://travis-ci.org/redde/redditor)
[![Code Climate](https://codeclimate.com/github/redde/redditor.png)](https://codeclimate.com/github/redde/redditor)

В рельсе для форм, созданных через form_for
  enctype="multipart/form-data"
прописывается автоматически, если в форме присутствует input file_field, но учитывая, что у нас в форме блок с картинкой изначально может отсутствовать, данный отрибут нужно прописать принудительно для формы в которую вы добавляете redditor
  html: {multipart: true}

Вероятно, на multipart можно забить, если все загрузки будут происходить через fileapi
todo: проверить вариант загрузки через fileapi c последующим сохранением всей формы через submit.
Как вариат добавлять атрибут с помощью js

Add gem to your Gemfile

    gem 'fileapi'
    gem 'redditor'

or

    gem 'fileapi', :github => 'redde/fileapi'
    gem 'redditor', :github => 'redde/redditor'

and

    bundle

### TODO:
add **fileapi** to automation dependencies



Then generate migrations

    bundle exec rake redditor:install:migrations

And migrate the database

    bundle exec rake db:migrate

Add this to model

    has_redditor

In admin new/edit view if that model add

    %div= render "redditor/admin/page", {f: f}

Add `multipart: true` to form of object with redditor

    html: {multipart: true}

Add engine to `routes.rb`

    mount Redditor::Engine => "/redditor"

Add this line to edit action in controller (change @article to you model)

    @article.build_page.save unless @article.page

Add redditor js to your js manifest file for admin (admin.js)
    //= require redditor

что включает:
    //= require jquery
    //= require jquery_ujs
    //= require jquery-ui/sortable
    //= require fileapi
    // and redditor's files

Add redditor styles to css manifest file for admin (admin.css)

    //= require redditor