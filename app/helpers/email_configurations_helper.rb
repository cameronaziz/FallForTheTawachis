module EmailConfigurationsHelper
  def configuration_link(id)
    link_to @email_configurations.where(field_id: id).first.value, edit_email_configuration_path(@email_configurations.where(field_id: id).first)
  end
end
