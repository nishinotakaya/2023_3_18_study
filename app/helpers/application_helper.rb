module ApplicationHelper
  def header_link_item(name, path) #
    class_name = 'nav-item' #bootstrap
    class_name << 'active' if current_page?(path) #表示するパスと引数のパスが一緒だったらactiveを追加

    content_tag :li, class: class_name do #任意のhtmlを指定する！
      link_to name, path, class: 'nav-link' #liタグの中にaタグが埋め込まれる
    end 
  end
end
