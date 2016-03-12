require "spec_helper"

module Joven
  module Routing
    class Router
      attr_reader :route_data

      def draw(&block)
        instance_eval(&block)
        self
      end
    end
  end
end

describe Joven::Routing::Router do
  def draw(&block)
    router = Joven::Routing::Router.new
    router.draw(&block).route_data
  end

  def route(regexp, placeholders, controller, action, path)
    pattern = [regexp, placeholders]
    { path: path, pattern: pattern, klass_and_method: [controller, action] }
  end

  context "endpoints" do
    context "get '/photos', to: 'photos#index'" do
      subject do
        draw { get "/photos", to: "photos#index" }
      end

      route_data = { path: "/photos",
                     pattern: [%r{^/photos$}, []],
                     klass_and_method: ["PhotosController", :index]
                   }

      it { is_expected.to eq route_data }
    end

    context "get '/photos/:id', to: 'photos#show'" do
      subject do
        draw { get "/photos/:id", to: "photos#show" }
      end

      route_data = { path: "/photos/:id",
                     pattern: [%r{^/photos/(?<id>[^/?#]+)$}, ["id"]],
                     klass_and_method: ["PhotosController", :show]
                   }

      it { is_expected.to eq route_data }
    end

    context "get '/photos/:id/edit', to: 'photos#edit'" do
      subject do
        draw { get "/photos/:id/edit", to: "photos#edit" }
      end

      regexp = %r{^/photos/(?<id>[^/?#]+)/edit$}
      route_data = { path: "/photos/:id/edit",
                     pattern: [regexp, ["id"]],
                     klass_and_method: ["PhotosController", :edit]
                   }

      it { is_expected.to eq route_data }
    end

    context "get 'album/:album_id/photos/:photo_id',
      to: 'photos#album_photo'" do
      subject do
        draw do
          get "/album/:album_id/photos/:photo_id",
              to: "photos#album_photo"
        end
      end

      regexp = %r{^/album/(?<album_id>[^/?#]+)/photos/(?<photo_id>[^/?#]+)$}
      route_data = { path: "/album/:album_id/photos/:photo_id",
                     pattern: [regexp, %w(album_id photo_id)],
                     klass_and_method: ["PhotosController", :album_photo]
                   }

      it { is_expected.to eq route_data }
    end
  end
end
