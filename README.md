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