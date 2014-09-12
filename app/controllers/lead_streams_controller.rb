class LeadStreamsController < ApplicationController
  before_action :set_lead_stream, only: [:show, :edit, :update, :destroy]

  # GET /lead_streams
  # GET /lead_streams.json
  def index
    @lead_streams = LeadStream.all
  end

  # GET /lead_streams/1
  # GET /lead_streams/1.json
  def show
  end

  # GET /lead_streams/new
  def new
    @lead_stream = LeadStream.new
  end

  # GET /lead_streams/1/edit
  def edit
  end

  # POST /lead_streams
  # POST /lead_streams.json
  def create
    @lead_stream = LeadStream.new(lead_stream_params)
    @lead_stream[:user_id] = current_user.id
    respond_to do |format|
      if @lead_stream.save
        flash[:success] = "Successfully created your stream"
        format.html { redirect_to dashboard_root_path }
        format.json { render :show, status: :created, location: @lead_stream }
      else
        flash[:error] = "Two streams cannot have the same city and category"
        format.html { redirect_to dashboard_root_path }
        format.json { render json: @lead_stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lead_streams/1
  # PATCH/PUT /lead_streams/1.json
  def update
    respond_to do |format|
      if @lead_stream.update(lead_stream_params)
        format.html { redirect_to @lead_stream, notice: 'Lead stream was successfully updated.' }
        format.json { render :show, status: :ok, location: @lead_stream }
      else
        format.html { render :edit }
        format.json { render json: @lead_stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lead_streams/1
  # DELETE /lead_streams/1.json
  def destroy
    @lead_stream.destroy
    respond_to do |format|
      format.html { redirect_to lead_streams_url, notice: 'Lead stream was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead_stream
      @lead_stream = LeadStream.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_stream_params
      params.require(:lead_stream).permit(:user_id, :category_id, :city_id)
    end
end
