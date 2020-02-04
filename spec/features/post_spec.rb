require 'rails_helper'

feature 'post', type: :feature do
  # このブロックの内部にscenarioを記述していく
  let(:user){ create(:user) }

  scenario 'post tweet' do
    #ログイン前には投稿ボタンがない
    visit root_path
    expect(page).to have_no_content('投稿する')

    #ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[type="submit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('投稿する')

    #ツイートの投稿
    expect{
      click_link('投稿する')
      expect(current_path).to eq new_post_path
      fill_in 'file', with: 'https://s.eximg.jp/expub/feed/Papimami/2016/Papimami_83279/Papimami_83279_1.png'
      fill_in 'title', with: 'テスト'
      fill_in 'text' , with: 'これはテストです'
      find('input[type = "submit"]').click
    }.to change(Post, :count).by(1)
  end
end