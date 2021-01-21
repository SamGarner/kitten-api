class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(allowed_kitten_params)
    if @kitten.save
      flash[:notice] = 'Saved to database!'
      redirect_to @kitten
    else
      flash.now[:error] = 'Error. Please double-check your entry.'
      render :new
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(allowed_kitten_params)
      flash[:notice] = 'Successfully updated!'
      redirect_to @kitten
    else
      flash.now[:error] = 'Error. Please double-check your entry.'
      render :edit
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    if @kitten.destroy
      flash[:success] = 'Delete successful.'
      redirect_to :root
    else
      flash[:notice] = 'Delete failed. Please try again.'
      redirect_to @kitten
    end
  end

  private

  def allowed_kitten_params
    params.require(:kitten).permit(:name, :age, :softness, :cuteness)
  end
end
