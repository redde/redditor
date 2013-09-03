REDDE.redditor.$el
.append('<%= j(render(partial: "admin/pages/wrapper", layout: "admin/pages/wrap_dd", locals: {content_block: @content_block, page: @page})) %>')
.find("textarea:visible:not(.nowred)").redactor(reddactorSettings)
.end()
.find("ul.slider-block-images").sortable REDDE.redditor.sliderBlockImagesSortableParams
REDDE.redditor.sortList()
selectLang(location.hash.replace("#",""))