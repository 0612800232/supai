# encoding: utf-8
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def is_login
    session[:is_login]
  end

  def get_login_name
    session[:login_name]
  end

  def show_error_in_chinese(errors)
    errors.each{ |key, msg| yield msg}

  end
  def  error_messages_for(object_name)
    object = instance_variable_get("@#{object_name}")
    if object && !object.errors.empty?
      error_lis = []
      object.errors.each{ |key, msg| error_lis << content_tag("li", msg) }
      content_tag("div", content_tag( "h2", "哦哦~~~出错了" ) + \
          content_tag("ul", error_lis), "id" =>  "errorExplanation", \
          "class" =>  "errorExplanation" )
    end
  end

  def get_flash(type)
    if flash!= nil && flash.length!=0
      if type=='notice'
        content_tag("div", flash[:notice], "id" =>  "notice", "class" =>  "notice" )
      elsif type=='errorExplanation'
        content_tag("div", content_tag( "h2", "哦哦~~~请注意" ) +\
            content_tag("ul")+content_tag("li", flash[:notice]),\
            "id" =>  "errorExplanation", "class" =>  "errorExplanation" )
      end
    end
  end
  #html内容切割
  def strip_html(text,len=0,endss="...")
    return "" if text==nil
    if text.length>0
      ss=text.gsub(/<\/?[^>]*>/,"")

      if len>0 && ss.length>0
        ss = truncate_u(ss,len,endss)
      end
    end
    return ss
  end
  
  def truncate_u(text, length = 30, truncate_string = "...")
    l=0
    char_array=text.unpack("U*")
    char_array.each_with_index do |c,i|
      l = l+ (c<127 ? 0.5 : 1)
      if l>=length
        return char_array[0..i].pack("U*")+(i<char_array.length-1 ? truncate_string : "")
      end
    end
    return text
  end

  def forum_tab forum
    if forum
      if forum.father ==nil
        return  "<span>" + link_to("首页","/") +  " > "+  link_to(forum.name,"/homes/forums/#{forum.id}") +"</span>"
      end
      if forum.father!= nil
        return  "<span>" +   link_to("首页","/") +  " > "+  link_to(forum.father.name,"/homes/forums/#{forum.father.id}")+  "> "+  link_to(forum.name,"/homes/forums/#{forum.id}") +"</span>"
      end
    else
       return    link_to("首页","/") 
    end

  end




def create_html
  top =  create_html_top
  body = create_html_body
  foot = create_html_foot
   ERB.new(top+body+foot).result(self.send( :binding ))  
end

  def create_html_top
   @temp_top =  PageTemp.find_by_temp_type_and_is_acticity("页头",true) 
    ERB.new(@temp_top.content).result(self.send( :binding ))  if @temp_top
  end

   def create_html_left
   @temp_left =  PageTemp.find_by_temp_type_and_is_acticity("左侧导航",true) 
    ERB.new(@temp_left.content).result(self.send( :binding ))  if @temp_left
  end

  def create_html_body
    if request.parameters[:controller] == "homes" 
        
      if request.parameters[:action] == "index"
         @temp_body =  PageTemp.find_by_temp_type_and_is_acticity("主页",true)
      elsif  request.parameters[:action] == "forums" or request.parameters[:action] == "goods"
          @temp_body = @forum.page_temp
         @temp_body =  PageTemp.find_by_temp_type_and_is_acticity("栏目",true) if  @temp_body==nil
      elsif  request.parameters[:action] == "articles"
        @temp_body = @article.page_temp
         @temp_body =  PageTemp.find_by_temp_type_and_is_acticity("文章",true)  if  @temp_body==nil
      elsif  request.parameters[:action] == "courses"
        @temp_body = @course.page_temp
        @temp_body =  PageTemp.find_by_temp_type_and_is_acticity("课程",true)  if  @temp_body==nil
      end   
       return ERB.new(@temp_body.content).result(self.send( :binding ))  if @temp_body
    end

  end

  def create_html_foot
   @temp_foot =  PageTemp.find_by_temp_type_and_is_acticity("页尾",true)
   ERB.new(@temp_foot.content).result(self.send( :binding ))  if @temp_foot
  end
  
end