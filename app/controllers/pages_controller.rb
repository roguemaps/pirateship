class PagesController < ApplicationController

  def landing
    puts "==================landing================================"  
    @businesses = Business.all
    @business = Business.find(params[:id])
  end
  
  def about
  end
  
  def index
    puts "===============index==================================="
    
  end
  
  def show
    puts "===============show==================================="
    
  end
  
end
