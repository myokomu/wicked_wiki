def sign_in(user)
  visit '/users/sign_in'
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def sign_out
  visit '/'
  click_link("Sign Out")
end

def create_admin_and_sign_in
  admin = FactoryGirl.create(:admin)
  sign_in admin
end

def facgurl(resource)
  FactoryGirl.create(resource)  
end