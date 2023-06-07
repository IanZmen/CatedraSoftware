require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  
  test "should get index" do
    get articles_url
    assert_response :success
  end
  
  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should show article" do
    @article = Article.new(title: "Creating an article by test", body: "This is a body!")
    @article.save
    get article_url(@article)
    assert_response :success
  end

  #test "should show article" do
    #@article = Article.new(title: "Creating an article by test", body: "This is a body!")
    #@article.save
    #get "/articles/#{@article.id}"
    #assert_response :success
  #end
  #Si es muy difícil usar los helpers de paths, pueden indicar la URL manualmente.
   
  test "should create article" do
    assert_difference("Article.count") do
      post articles_url, params: { article: {title:"Creating an article by test", body: "This is a body!"} }
    end
    assert_redirected_to article_path(Article.last)
  end

  test "should destroy article" do
    @article = Article.new(title: "Other article by test", body: "Delete me!")
    @article.save
    assert_difference("Article.count", -1) do delete article_url(@article)
    end
    assert_redirected_to articles_url
  end
   

end
