# после редактирования хелперов необходимо рестартить сервер

module Redditor
  module ApplicationHelper
    def real_name content_block
      content_block.class.name.underscore.sub('redditor/', '')
    end

    def redditor_validate f
      render "redditor/admin/validate", {f: f} 
    end

    def redditor_form(f, &block)
      id = "#{real_name(f.object)}_"
      id += f.object.id.nil? ? "#{f.object.object_id}" : "#{f.object.id}"
      f.object_name.sub!(/\[\d*\]/, "[#{f.object.object_id}]") if f.object.object_id.present?
      index = if f.object.object_id.present?
        f.object.object_id
      else
        f.index
      end
      data = { 'object-name' => f.object_name, 'object-id' => index }
      content_tag(:div, capture(&block), class: 'redditor__form', id: id, data: data)
    end

    def redditor_slider_block_kind f, slider_block
      if @content_block
        kind = params.try(:[], 'content_block').try(:[], 'kind')
      else
        params_array = f.object_name.split(/(?:[\[\]]{1,2})/)
        par = params
        params_array.each do |p|
          par = par.try(:[], p)
        end
        kind = par.try(:[], 'kind')
      end
      return kind == 'description'
    end
  end
end
