class SearchController < ApplicationController
  def search
    @content = params[:content]
    @model = params[:model]
    @how = params[:how]
    @datas = search_for(@how, @model, @content)
  end
  
  private
  
  def match(model, content)
    if model == 'user'
      User.where(name: content)
    elsif model == 'book'
      Book.where(title: content)
    end
  end
  
  def forward(model, content)
    if model == 'user'
      User.where("name LIKE?", "#{content}%")
    elsif model == 'book'
      Book.where("title LIKE?", "#{content}%")
    end
  end
  
  def backward(model,content)
    if model == 'user'
      User.where("name LIKE?", "%#{content}")
    elsif model == 'book'
      Book.where("title LIKE?", "%#{content}")
    end
  end
  
  def partial(model, content)
    if model == 'user'
      User.where("name LIKE?", "%#{content}%")
    elsif model == 'Book'
      Book.where("title LIKE?", "%#{content}%")
    end
  end
  
  def search_for(how, model, content)
    case how
    when 'match'
      match(model, content)
    when 'forward'
      match(model, content)
    when 'backward'
      match(model, content)
    when 'partial'
      match(model, content)
    end
  end
end
