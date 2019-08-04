crumb :root do
  link "Home", root_path
end

crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypage_index_path
end

crumb :profile do
  link "プロフィール", profile_mypage_index_path
  parent :mypage
end

crumb :list do
  link "出品した商品-出品中", list_mypage_index_path
  parent :mypage
end

crumb :edit do
  link "出品商品画面", edit_mypage_path(:id)
  parent :mypage
  parent :list
end

crumb :card do
  link "支払い方法", card_mypage_path
  parent :mypage
end

crumb :information do
  link "本人情報の登録", information_mypage_index_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_mypage_index_path
  parent :mypage
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