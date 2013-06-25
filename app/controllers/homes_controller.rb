# encoding: utf-8

class HomesController < ApplicationController 
   caches_page :index, :forums,:articles,:goods
  before_filter :get_head
  layout "home"

  def index

  end


  def apply
    @forum = Forum.find_by_code("index")
     @apply = Apply.new
  end

  def get_head
    @web_info = WebInfo.find(:all)[0]
    @forum_first = Forum.find(:all,:conditions=>["father_id is null and order_num > 0 and order_num <11 and code !='index'"],:order=>"order_num asc")
  end

def articles
    @article = Article.find(params[:id])
    @forum = @article.forum ? @article.forum : @article.father_forum
    if @article.read_num
    @article.read_num +=1
    else
      @article.read_num = 0
    end
    @article.save
  end
  
   def forums
    @forum = Forum.find(params[:id])
    articles = @forum.articles_father.length >0 ? @forum.articles_father : @forum.articles
   @forum.articles_father = articles.paginate :page => params[:page]||1,
                            :per_page=>10,
                            :order=>"id asc" if params[:page].class == Fixnum
  end

  def goods
     @forum = Forum.find_by_code("pro_info")
   render "forums"
  end


   def good
     @forum = Forum.find_by_code("pro_info")
     @good = Good.find_by_id(params[:id])
   render "forums"
  end
  
  
  
  


    def courses
    @course = Course.find(params[:id])
    @forum =  Forum.find_by_code("kc")
  end

def read
  @article = Article.find(params[:id])
    if @article.read_num
    @article.read_num +=1
    else
      @article.read_num = 0
    end
    @article.save
     render :text =>"SUCCESS"
end





end
