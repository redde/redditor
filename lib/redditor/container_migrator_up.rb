# coding: utf-8

module Redditor
  class ContainerMigratorUp
    def run
      migrate_pages
    end

    def migrate_pages
      Redditor::Page.all.each do |page|
        item = page.pageable
        @i = 0
        page.content_blocks.each do |content_block|
          ContentBlockContainer.new(item, content_block, @i).migrate
          @i += 1
        end
      end
    end
  end

  class ContentBlockContainer
    attr_accessor :item, :content_block, :position, :container

    def initialize(item, content_block, position)
      @item, @content_block, @position = item, content_block, position
    end

    def migrate
      puts "-- Migrating #{content_block.class.name}"
      set_container
      update_item
    end

    def container_class
      return Redditor::Slider if content_block.class.name == 'Redditor::TmpSliderBlock'
      Redditor::Container
    end

    def set_container
      @container = container_class.find_or_create_by(redditable: item, position: position)
    end

    def update_item
      return update_slider if content_block.class.name == 'Redditor::TmpSliderBlock'
      update_other_items
    end

    def update_other_items
      content_block.update(container_id: container.id)
    end

    def update_slider
      content_block.images.each do |i|
        i.update(container_id: container.id)
      end
    end
  end
end
