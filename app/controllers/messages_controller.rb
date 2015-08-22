class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      render json: { message: @message, status: :created }
    else
      render json: { errors: @message.errors, status: :unprocessable_entity }
    end
  end

  def update
    if @message.update(message_params)
      render json: { message: @message, status: :ok }
    else
      render json: { errors: @message.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @message.destroy

    render nothing: true
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.permit(:message, :sender_id, :receiver_id)
    end
end
