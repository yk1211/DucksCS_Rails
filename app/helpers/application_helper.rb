module ApplicationHelper
  def page_title
    title = "Ducks CS Course Review"
    title = @page_title + " - " + title if @page_title
    title
  end
end
