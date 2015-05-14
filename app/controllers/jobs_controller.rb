class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)
    if @job.save
      redirect_to jobs_path, notice: 'Job was successfully created.'
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    if @job.update(job_params)
      render :show, status: :ok, location: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
    #redirect_to jobs_path
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end

  def show
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :location, :company)
  end
end
