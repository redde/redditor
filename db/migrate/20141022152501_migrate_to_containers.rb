class MigrateToContainers < ActiveRecord::Migration
  def up
    transaction do
      Redditor::ContainerMigratorUp.new.run
    end
  end

  def down
  end
end
