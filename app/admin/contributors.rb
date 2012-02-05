ActiveAdmin.register Contributor do
  index do
    column :first_name
    column :last_name
    column :email
    column :desired_week
    default_actions
  end
end
