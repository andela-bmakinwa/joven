require "spec_helper"
require "todolist_controller"

TodoApplication = Todolist::Application.new

describe "Todolist App" do
  include Rack::Test::Methods

  TodoApplication = Todolist::Application.new

  def app
    require "todolist/config/routes.rb"
    TodoApplication
  end

  it "returns a list of all my todos" do
    get "/todos"
    expect(last_response).to be_ok
    expect(last_response.body).to eq(
      "['Create application', 'Do KBBs', 'Homestudy revamp', 'Buy a phone']"
    )
  end

  it "returns first item in my todolist" do
    get "/todo/first"
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Create application")
  end

  it "can respond to post request" do
    post "/todos"
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Post go swimming")
  end

  it "can respond to put request" do
    put "/todo/2"
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Put Create application")
  end

  it "can respond to delete request" do
    delete "/todo/3"
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Delete Create application")
  end
end

describe Joven do
  it "has a version number" do
    expect(Joven::VERSION).not_to be nil
  end
end
