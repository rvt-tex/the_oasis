module ApplicationHelper

    def footer_class
        'page-footer row bg-dark text-white'
    end

    def main_col_class(text)
        content_for :main_col_class, text
    end

    def title(text)
        content_for :title, text
    end

    def body_container_class
        "container mt-5"
    end 

    def card_header
        content_tag :div, class: card_header_class do
          yield
        end
    end

    def card_title_class
        "card-title mt-3 text-center"
    end

    def err
        content_for :err do
          yield
        end
    end

    def owner 
       if @client == current_client
       end
    end 
end
