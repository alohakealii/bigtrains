class PostsController < ApplicationController
  before_action :set_post, only: [:update, :destroy]

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @topic = @post.topic
    @group = @topic.group

    respond_to do |format|
      if @post.save
        format.html { redirect_to group_topic_path(@group, @topic), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render @topic }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to group_topic_path(group_id: @topic.group_id, id: @topic), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render topic_path(id: session[:topic_id]) }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to group_topic_path(@group, @topic), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
      @topic = @post.topic
      @group = @topic.group
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params[:post][:user_id] = session[:user_id]
      params[:post][:topic_id] = params[:topic_id]
      params.require(:post).permit(:body, :topic_id, :user_id)
    end
end
