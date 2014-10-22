namespace :content do
  task old: :environment do
    content_for_article(Article.create(title: 'shit'))
    content_for_article(Article.create(title: 'bit'))
  end

  def content_for_article(article)
    page = Redditor::Page.where(pageable: article).first
    page ||= Redditor::Page.new(pageable: article)
    page.save
    page.text_blocks.build(content: "abudabi").save
    page.video_blocks.build(link: "youtube").save
    page.images.build(src: 'abc.jpg').save
    slider = page.slider_blocks.build
    slider.save
    5.times do
      slider.images.build(src: 'abc.jpg').save
    end
  end
end
