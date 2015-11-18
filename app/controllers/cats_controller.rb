class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new
    # Will feed empty values for all instance variables into the form
  end

  def edit
    @cat = Cat.find(params[:id])
    # Will feed real, determined values for a specific cat into the form
  end
  # Either way, @cat will be defined in the form, and if we default the
  # fields to values from @cat, the form should work.
  def update
    cat_change = Cat.find(params[:id])
    cat_change.name = params[:cat][:name]
    cat_change.sex = params[:cat][:sex]
    cat_change.color = params[:cat][:color]
    cat_change.birth_date = params[:cat][:birth_date]
    cat_change.description = params[:cat][:description]

      redirect_to cat_url(cat_change.id)
    else
      raise "Error!"
    end
  end

  def destroy
    dead_cat = Cat.find(params[:id])
    dead_cat.destroy
    redirect_to cats_url
  end

  def create
    new_cat = Cat.new
    new_cat.name = params[:cat][:name]
    new_cat.sex = params[:cat][:sex]
    new_cat.color = params[:cat][:color]
    new_cat.birth_date = params[:cat][:birth_date]
    new_cat.description = params[:cat][:description]
    if new_cat.save
      redirect_to cat_url(new_cat.id)
    else
      raise "Error!"
    end
  end
end
