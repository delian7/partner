class UsersGrid

  include Datagrid

  scope do
    User
  end

  filter(:id, :string, :multiple => ',')
  filter(:email, :string)
  filter(:first_name, :string)
  filter(:last_name, :string)

  column(:name, :mandatory => true)
  column(:email, :mandatory => true) do |user|
    format(User.email) do |value|
      link_to value, "mailto:#{value}"
    end
  end
  column(:name, :mandatory => true)
end
