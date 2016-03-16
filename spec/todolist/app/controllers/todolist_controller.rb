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
    redirect_to :index
  end

  def update
    @name = "Update something"
    redirect_to :index
  end

  def destroy
    @name = "Destroy something"
    redirect_to :index
  end
end
