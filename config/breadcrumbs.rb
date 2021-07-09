crumb :root do
  link "Home", root_path
end

crumb :animals do
  link "ペットの詳細ページ", tweets_path
  parent :root
end

crumb :animal_tweet do
  link "ツイート投稿ページ", tweets_path
  parent :animals
end

crumb :tweets do
  link "ツイートの詳細ページ", tweet_path
  parent :root
end

crumb :animal_new do
  link "ペットの登録ページ", new_animal_path
  parent :root
end

crumb :animal_user do
  link "登録したペットの一覧ページ", users_path
  parent :root
end

crumb :animal_search do
  link "検索結果ページ", animals_search_path
  parent :root
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).