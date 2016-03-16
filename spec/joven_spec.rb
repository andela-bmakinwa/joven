require "spec_helper"

APP_ROOT ||= __dir__ + "/todolist"

describe Joven do
  it "has a version number" do
    expect(Joven::VERSION).not_to be nil
  end
end

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
    expect(last_response.status).to eq 200
    expect(last_response.body.include?("Create application")).to eq true
  end

  it "returns first item in my todolist" do
    get "/todo/first"
    expect(last_response).to be_ok
    expect(last_response.body.include?("HELLO WORLD")).to eq true
  end

  it "can respond to post request" do
    post "/todos"
    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
    expect(last_response.body.include?("Create something")).to eq true
  end

  it "can respond to put request" do
    put "/todo/2"
    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
    expect(last_response.body.include?("Update something")).to eq true
  end

  it "can respond to delete request" do
    delete "/todo/3"
    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
    expect(last_response.body.include?("Destroy something")).to eq true
  end
end
