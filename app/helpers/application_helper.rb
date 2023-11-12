module ApplicationHelper

  def current_year
    Date.today.year
  end

  def githab_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_message
    if flash.empty?
      content_tag :div, class: "flash" do
        flash.each do |key, message|
          content_tag :div, message, class: "flash #{key}"
        end
      end
    end
  end
end
