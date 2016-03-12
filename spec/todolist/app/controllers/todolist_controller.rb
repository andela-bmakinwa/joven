class TodolistController < Joven::BaseController
  def index
    @name = "['Create application', 'Do KBBs',
      'Homestudy revamp', 'Buy a phone']"
    @todo = Todo.new
    @todo.name = "Buy a phone"
    @todo.description = "I want to buy an iphone 6"
    @todo.save
  end

  def show
    @todos = Todo.all
    @todo = Todo.find(2)
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
