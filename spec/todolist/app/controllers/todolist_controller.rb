class TodolistController < Joven::BaseController
  def index
    "['Create application', 'Do KBBs', 'Homestudy revamp', 'Buy a phone']"
  end

  def show
    "Create application"
  end

  def create
    "Post go swimming"
  end

  def update
    "Put Create application"
  end

  def destroy
    "Delete Create application"
  end
end
