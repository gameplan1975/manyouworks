require 'rails_helper'
RSpec.describe 'Tasks', type: :system do
  describe "タスク機能のテスト" do
    before do
      visit new_task_path
      fill_in "Name", with: "test01"
      fill_in "Content", with: "content01"
      fill_in "Task limit", with: "05-05-2020"
      click_button "登録する"
    end
  
    context "タスクを作成した場合" do
      it "投稿した内容が表示されること" do
       expect(page).to have_content "test01"
        expect(page).to have_content "content01"
        expect(page).to have_content "2020-05-05"
      end
    end
  end
end