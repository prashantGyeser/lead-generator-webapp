require 'setup_status'

RSpec.describe SetupStatus do

  before(:each) do
    @user = User.create(email: 'rspec@test.com', password: 'password@123', password_confirmation: 'password@123')
    @city = City.create(name: "New York")
    @category = Category.create(name: "bbq")
    @token = Token.create(provider: 'twitter', oauth_token: '323432jhdskljfdsdf', oauth_secret: 'dfjsdlfjsdfsm3234', user_id: @user.id)
  end

  it "should return true when the user has finished the setup" do
    UserCity.create(user_id: @user.id, city_id: @city.id)
    UserCategory.create(user_id: @user.id, category_id: @category.id)

    expect(SetupStatus.setup_complete?(@user.id)).to eq true

  end

  it "should return false if any step in the setup is not completed" do
    UserCity.create(user_id: @user.id, city_id: @city.id)

    expect(SetupStatus.setup_complete?(@user.id)).to eq false
  end




end