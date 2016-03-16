require "spec_helper"
require "support/blog_helper"

APP_ROOT ||= __dir__ + "/blog"

describe Joven do
  it "has a version number" do
    expect(Joven::VERSION).not_to be nil
  end
end

BlogApplication = Blog::Application.new

describe "Blog App" do
  include Rack::Test::Methods
  include BlogHelper

  BlogApplication = Blog::Application.new

  def app
    require "blog/config/routes.rb"
    BlogApplication
  end

  describe "GET '/'" do
    it "renders the home page" do
      get "/"

      assert_status_body_response "Welcome to the index page"
    end
  end

  describe "GET '/invalid' route" do
    it "renders default page if route is not found" do
      get "/invalid"

      assert_status_body_response "Route not found", 404
    end
  end

  describe "GET my_pages" do
    context "'/my_pages/about'" do
      it "renders my_pages about page" do
        get "/my_pages/about"

        assert_status_and_response 200
        assert_body_has "Makinwa"
      end
    end

    context "'/my_pages/tell_me'" do
      it "renders my_pages tell_me page" do
        get "/my_pages/tell_me"

        assert_status_and_response 200
        assert_body_has "Makinwa"
      end
    end
  end

  describe "GET posts " do
    context "'/posts'" do
      it "returns all posts" do
        get "/posts"

        assert_status_and_response 200
        assert_body_has "Rack deep dive"
        assert_body_has "Edit"
        assert_body_has "Delete"
      end
    end

    context "'/posts/:id'" do
      it "returns a post" do
        get "/posts/2"

        assert_status_and_response 200
        assert_body_has "Rack deep dive"
        assert_body_has "Building rack web applications"
        assert_body_has "All Posts"
      end
    end

    context "'/posts/new'" do
      it "renders the new page" do
        get "/posts/new"
        assert_status_and_response 200
        assert_body_has "<h1>Create new post </h1>"
      end
    end

    context "'/post/:id/edit'" do
      it "renders the edit page" do
        get "/post/2/edit"
        assert_status_and_response 200
        assert_body_has "Edit Post"
        assert_body_has "Rack deep dive"
      end
    end
  end

  describe "POST '/posts' " do
    it "creates a post and renders the create page" do
      post "/posts", post: {
        title: "Rack deep dive",
        body: "Building rack web applications"
      }

      assert_status_and_response 200
      assert_body_has "Back to Index"
    end
  end

  describe "PUT '/posts/:id" do
    it "updates a post and renders the index page" do
      post = {
        title: "Autoloading Classes",
        body: "Rack App involving autoloading classes"
      }

      put "/posts/3", post: post
      assert_status_and_response 200
      assert_body_has post[:title]
    end
  end

  describe "PATCH '/posts/:id" do
    it "updates a post and renders the index page" do
      post = {
        title: "Better routing",
        body: "Routing in a rack app"
      }

      patch "/posts/3", post: post
      assert_status_and_response 200
      assert_body_has post[:title]
    end
  end

  describe "DELETE '/posts/:id" do
    it "deletes a post and renders the index page" do
      post = {
        id: 4,
        title: "Better routing",
        body: "Routing in a rack app"
      }

      post "/posts", post: post

      delete "/posts/#{post[:id]}"

      assert_status_and_response 404
      expect(last_response.body.include?((post[:id]).to_s)).to eq false
    end
  end
end
