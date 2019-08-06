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
