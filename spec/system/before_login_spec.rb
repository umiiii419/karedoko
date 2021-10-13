require 'rails_helper'

describe 'ユーザーログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it 'ログインリンクが表示される' do
        expect(page).to have_link "", href: new_user_session_path
      end
      it '新規登録のリンクが表示される' do
        expect(page).to have_link "", href: new_user_registration_path
      end
    end
  end

  describe 'ユーザー新規登録のテスト' do
    before do
      visit new_user_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_up'
      end
      it 'nicknameフォームが表示される' do
        expect(page).to have_field 'user[nickname]'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it '登録ボタンが表示される' do
        expect(page).to have_button '登録'
      end
    end

    context '新規登録成功のテスト' do
      before do
        fill in 'user[nickname]',              with: Faker::Name.name
        fill in 'user[email]',                 with: Faker::Internet.email
        fill in 'user[password]',              with: Faker::Internet.password(min_length :6)
        fill in 'user[password_confirmation]', with: 'password'
      end

      it '正しく新規登録れる' do
        expect { click_button '登録' }.to change(User.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先がトップ画面になっている' do
        click_button '登録'
        expect(current_path).to eq '/'
      end
    end
  end

  describe 'ユーザーログイン' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_in'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'ログインボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end
    end

    context 'ログイン成功のテスト' do
      before do
        fill in 'user[email]',                 with: user.email
        fill in 'user[password]',              with: user.password
        click_button 'ログイン'
      end

      it 'ログイン後のリダイレクト先がトップ画面になっている' do
        expect(current_path).to eq '/'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[name]', with: user.name
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end

    context 'ヘッダーの表示を確認' do
      it 'サイト名が表示される' do
        expect(page).to have_content 'カレドコ'
      end
      it 'トップリンクが表示される: 左上から1番目のリンクが「トップ」である' do
        top_link = find_all('a')[1].native.inner_text
        expect(top_link).to match(/top/i)
      end
      it 'マイページリンクが表示される: 左上から2番目のリンクが「マイページ」である' do
        users_link = find_all('a')[2].native.inner_text
        expect(users_link).to match(/users/i)
      end
      it 'ログアウトリンクが表示される: 左上から3番目のリンクが「ログアウト」である' do
        logout_link = find_all('a')[3].native.inner_text
        expect(logout_link).to match(/logoout/i)
      end
    end
  end

  describe 'ユーザーログアウトのテスト' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[name]', with: user.name
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      logout_link = find_all('a')[3].native.inner_text
      logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
      click_link logout_link
    end

    context 'ログアウト機能のテスト' do
      it '正しくログアウトできている: ログアウト後のリダイレクト先においてログイン画面へのリンクが存在する' do
        expect(page).to have_link '', href: '/users/sign_in'
      end
      it 'ログアウト後のリダイレクト先が、トップになっている' do
        expect(current_path).to eq '/'
      end
    end
  end
end
