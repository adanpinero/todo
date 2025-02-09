class ListsController < ApplicationController

  def create
    @list = List.new(params[:list])
    if @list.save
        flash[:notice] = "Tu lista ha sido creada"
    else
        flash[:alert] = "There was an error creating your list."
    end
    redirect_to(tasks_url(:list => @list.id))
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
    end
  end
end
