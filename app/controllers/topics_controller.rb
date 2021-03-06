class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :update, :destroy]

  # GET /topics/1
  # GET /topics/1.json
  def show
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)
    @group = @topic.group

    respond_to do |format|
      if @topic.save
        format.html { redirect_to group_topic_path(id: @topic.id), notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render group_path }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to group_topic_path(@group, @topic), notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to @group, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
      session[:topic_id] = params[:id]
      @group = @topic.group
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params[:topic][:group_id] = params[:group_id]
      params.require(:topic).permit(:group_id, :title)
    end
end
