require 'rails_helper'
RSpec.describe 'Tasks', type: :system do
  before do
  end
  describe "ユーザ登録のテスト" do
    before do
      visit new_user_path
      fill_in "Name", with: "Admin"
      fill_in "Email", with: "aaa@aaa.aaa"
      fill_in "Password", with: "aaaaaa"
      fill_in "Password confirmation", with: "aaaaaa"
      click_button "登録する"
    end
    context "最初のユーザーを登録したとき" do
      it "必ず管理者に設定されること" do
        expect(page).to have_content "Administrator"
      end
      it "管理者画面に遷移できること" do
        click_link "Admin Page"
        expect(page).to have_content 'Admin Page'
      end
      it "詳細画面に遷移できること" do
        click_link "Admin Page"
        click_link "Show"
        expect(page).to have_content "Admin's Page"
      end
      it "管理者画面から新規ユーザーを登録できること" do
        click_link "Admin Page"
        click_link "New User"
        fill_in "Name", with: "normal02"
        fill_in "Email", with: "ccc@ccc.ccc"
        fill_in "Password", with: "aaaaaa"
        fill_in "Password confirmation", with: "aaaaaa"
        click_button "登録する"
        expect(page).to have_content "normal02"
      end
    end
    context "2人目のユーザーを登録したとき" do
      before do
        visit new_user_path
        fill_in "Name", with: "normal"
        fill_in "Email", with: "bbb@bbb.bbb"
        fill_in "Password", with: "aaaaaa"
        fill_in "Password confirmation", with: "aaaaaa"
        click_button "登録する"
      end
      it "管理者に設定されないこと" do   
        expect(page).to_not have_content "Administrator"
      end
      it "管理者以外が管理画面にアクセスできないこと" do   
        expect(current_path).to_not eq admin_users_path
      end
    end
  end
end