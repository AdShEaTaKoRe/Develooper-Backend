class CompositionsController < ApplicationController

# def show
#   @composition = Composition.find(params[:id])
#   render json: @composition
# end

def list
# byebug
@composition = Composition.where(user_id: params[:user_id])
render json: @composition
end

def create
# byebug
  @composition = Composition.create(composition_params)
  if @composition.save
  render json: @composition
  else
    render json: @composition.errors, status: :unprocessable_entity
  end
end

def update
  if @composition.update(composition_params)
    render json: @composition
  else
    render json: @composition.errors, status: :unprocessable_entity
  end
end

private

def composition_params
  params.require(:composition).permit(:name, :layout, :bpm, :user_id)
end
end
