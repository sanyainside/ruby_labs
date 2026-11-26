class AddDeviseToUsers < ActiveRecord::Migration[8.1]
  def up
    users = Class.new(ActiveRecord::Base) do
      self.table_name = "users"
    end

    normalized = users.pluck(:id, :email).map do |id, email|
      [id, email.to_s.strip.downcase]
    end

    emails = normalized.map(&:last)
    if emails.any?(&:blank?) || emails.uniq.size != emails.size
      raise "Виправте порожні або дубльовані email у таблиці users."
    end

    normalized.each do |id, email|
      users.where(id: id).update_all(email: email)
    end

    add_column :users, :encrypted_password, :string, null: false, default: ""
    add_column :users, :role, :integer, null: false, default: 0
    add_index :users, :email, unique: true
  end

  def down
    remove_index :users, :email
    remove_column :users, :role
    remove_column :users, :encrypted_password
  end
end