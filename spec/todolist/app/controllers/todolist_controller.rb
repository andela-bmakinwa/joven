class TodolistController < Joven::BaseController
  def index
    @name = "['Create application', 'Do KBBs',
      'Homestudy revamp', 'Buy a phone']"
  end

  def show
    @todos = Todo.all
  end

  def create
    @name = "Create something"
    render :index
  end

  def update
    @name = "Update something"
    render :index
  end

  def destroy
    @name = "Destroy something"
    render :index
  end
end
