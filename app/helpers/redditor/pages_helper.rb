# coding: utf-8

module Redditor
  module PagesHelper
    def button_tag_add_fields(name, f, association)
      new_object = f.object.send(association).klass.new
      id = new_object.object_id
      fields = f.fields_for(association, new_object, child_index: id) do |builder|
        content_tag(:dd, :id => "#{association.to_s.singularize}_#{id}") do
          tag(:div, class: "handle") +
          link_to("Удалить", "javascript:void(0);", onclick: "if (confirm('dfasdsa')) $(this).closest('dd').remove();") + "\s" +
          link_to("Обновить", [:admin, @article.page, association], method: "post", class: "update-data", remote: true, data: {disable_with: "Обновляется"}) + "\s" +
          render("admin/pages/" + association.to_s.singularize, f: builder)
        end
      end
      
      button_tag(name, class: "add_fields", type: "button", data: {id: id, fields: fields.gsub("\n", "")})
    end

    def redditor_validate f
      render "redditor/admin/pages/validate", {f: f} 
    end
  end
end
