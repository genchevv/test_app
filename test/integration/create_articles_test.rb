require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "Radoslav", email: "r.genchew@gmail.com", password: "password")
  end
  
  test "get a new article form and create an article" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    
    assert_difference 'Article.count', 1 do
      post_via_redirect articles_path, article: {title: "Article Title", description: "Here are a description of this article"}
    end
    
    assert_template 'articles/show'
    assert_match "Article Title", response.body
  end

  
end
