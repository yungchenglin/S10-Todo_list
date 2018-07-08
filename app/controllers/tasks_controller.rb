 class TasksController < ApplicationController
    before_action :set_task, :only => [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.order(due_date: :asc)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if  @task.save
        redirect_to tasks_url
    else
      render :action => :new
    end
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to task_path(@task)
    else
      render :action => :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url
end
 
private

def set_task
  @task = Task.find(params[:id])
end

def task_params
  params.require(:task).permit(:name, :due_date, :note)
end





end
