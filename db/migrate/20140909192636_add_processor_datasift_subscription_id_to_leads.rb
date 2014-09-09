class AddProcessorDatasiftSubscriptionIdToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :processor_datasift_subscription_id, :integer
  end
end
