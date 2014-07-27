
if Rails.env == "development"
  user = User.create! :name => "Tester", :email => "t@t.com", :password => "tester", :password_confirmation =>"tester"
end
