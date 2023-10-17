module ApplicationHelper

  def current_year
    Date.today.year
  end

  def githab_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_message
    content_tag :div, class: "flash" do
      flash.map do |key, msg|
        content_tag :div, class: "flash.#{key}" do
          content_tag(:span, '&times;'.html_safe, class: :close) + msg
        end
      end.join().html_safe
    end
  end
end
