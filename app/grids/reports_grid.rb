class ReportsGrid

  include Datagrid

  scope do
    User
  end

  filter(:ucinetid, :string)
  filter(:first_name, :string)
  filter(:last_name, :string)

  column(:first_name, :mandatory => true)
  column(:last_name, :mandatory => true)
  column(:email, :mandatory => true) do |user|
    format(user.email) do |value|
        link_to value, "mailto:#{value}"
      end
  end
end
