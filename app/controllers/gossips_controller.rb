class GossipsController < ApplicationController
  
  def index
    @gossip = false
  end

  def new
    @gossip = Gossip.new
    @tags = Tag.all
  end

  def create
    puts "$"*60
    puts params["title"]
    puts params["content"]
    @gossip = Gossip.new(title: params["title"], content: params["content"], user: User.find_by(first_name: "anonymous"),)
    puts params.keys
    
    if @gossip.save # essaie de sauvegarder en base @gossip
      params.keys.each do |key|
        @gossip.tags << Tag.find(params["#{key}"]) if key.tr("0-9", "") == "tag"
      end 
      render :index
    else
      @tags = Tag.all
      render :new
    end
  end

  def show
    @id = params[:id]
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end
  
  def update
    puts @p = params
    @gossip = Gossip.find(params[:id])
    if @gossip.update(post_params)
      render :index
    else
      render :edit
    end
  end 

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end
  
  private

  def post_params
    post_params = params.require(:gossip).permit(:title, :content)
  end
  
end



