class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :mail, :spam]
  before_filter :authenticate, except: [:index, :show]

  def mail
    users = User.where(:notification => true)

    users.each do |user|
      UserMailer.article(@article, user).deliver
    end

    redirect_to @article, notice: 'Email Sent'
  end

  def spam
    users = User.where(:notification => true)

    users.each do |user|
      UserMailer.article(@article, user).deliver
    end
    redirect_to articles_path, notice: 'Email Sent'
  end


  # GET /articles
  # GET /articles.json
  def index
    @page = params['page']
    @articles = Article.order(:published_date => :desc).page(@page)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        users = User.where(:notification => true)

        users.each do |user|
          UserMailer.article(@article, user).deliver
        end
        format.html { redirect_to @article, notice: 'Article was created and sent.' }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  private

    def authenticate
      authenticate_user! && current_user.try(:admin?)
      if(! current_user.try(:admin?))
        redirect_to store_path
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :author, :published_date, :published, :content, :thumbnail)
    end
end
