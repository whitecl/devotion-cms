ActiveAdmin.register Contributor do
  index do
    column :first_name
    column :last_name
    column :email
    column :coordinator_approved
    default_actions
  end
end
