class ToolsController < ApplicationController
  layout 'admin_layout'
  before_action :authenticate
  def index
    @tools = Tool.all
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to admin_path
    else
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      redirect_to admin_path
    else
      render :edit
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    if @tool.destroy
      redirect_to admin_path
    end
  end

  private

    def tool_params
      params.require(:tool).permit(:link, :text)
    end
end
