class PaginationDetailLinkRenderer < WillPaginate::ViewHelpers::LinkRenderer
  
 
 def to_html  
     html = pagination.map do |item|
          item.is_a?(Fixnum) ?
            page_number(item) :
            send(item)
        end.join(@options[:link_separator])
        
        @options[:container] ? html_container(html) : html
  end 
  protected
  def page_number(page)
        unless page == current_page
          link(page, page, :rel => rel_value(page))
        else
          tag(:span, page, :class => 'current')
        end
      end 
       def next_page
        num = @collection.current_page < @collection.total_pages && @collection.current_page + 1
        previous_or_next_page(num, @options[:next_label], '')
      end
      
        def previous_or_next_page(page, text, classname)
        if page
          link(text, page, :class => classname)
        else
           link(text, "javacript:void(0)", :class => classname + ' disabled')
        end
      end
 
    def url(page)

       controller_name = @template.controller_name

       action_name = @template.action_name      

       params = @template.request.params

       if controller_name == "homes"   #到了我们要自定义的action了

           if action_name == "forums"
               return "/homes/forums/#{params[:id]}/#{page}"
           end
           
        if action_name == "goods"
               return "/homes/goods/#{params[:id]}/#{page}"
           end
       else
          super(page) #调用WillPaginate的默认生成的url
      end
  end
  
    

  
end
  