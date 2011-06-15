class OrdersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource

  def new
    @order = Order.new

    respond_to do |format|
      format.html
      format.js { render :partial => 'form' }
    end
  end

  def create
    @order = Order.new(params[:order])

    if @order.save
      respond_to do |format|
        format.html { redirect_to orders_path, :notice => "Order created successfully." }
        format.js
      end
    else
      render :action => 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    if @order.update_attributes(params[:order])
      redirect_to @order, :notice => "Order updated successfully."
    else
      render :action => 'edit'
    end
  end

  def index
    @orders = Order.order(:name).page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_path
  end
end
