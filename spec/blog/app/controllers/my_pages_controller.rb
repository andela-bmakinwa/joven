class MyPagesController < Joven::BaseController
  def about
    render :about, name: "Bukky", lastname: "Makinwa"
  end

  def tell_me
    @name = "Makinwa"
  end
end
