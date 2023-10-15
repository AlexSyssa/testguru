module ApplicationHelper

  def current_year
    Date.today.year
  end

  def githab_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_massage(alert)
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash alert'
    end
  end
  
end
