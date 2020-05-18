require 'rails_helper'
RSpec.describe 'Tasks', type: :system do
  describe "ラベル機能のテスト" do
    before do
      visit new_user_path
      fill_in "Name", with: "Admin"
      fill_in "Email", with: "aaa@aaa.aaa"
      fill_in "Password", with: "aaaaaa"
      fill_in "Password confirmation", with: "aaaaaa"
      click_button "登録する"
      visit new_label_path
      fill_in "Title", with: "LABEL01"
      click_button "登録する"
      visit new_label_path
      fill_in "Title", with: "LABEL02"
      click_button "登録する"
    end
    context "ラベル作成について" do
      it "ラベルを作成できること" do
        expect(page).to have_content "LABEL02"
      end
      it "タスク作成時に、作成したラベルを登録できること" do
        visit new_task_path
        fill_in "Name", with: "Task01"
        fill_in "Content", with: "content01"
        fill_in "Task limit", with:"05-05-2020"
        check 'LABEL01'
        click_button "登録する"
        expect(page).to have_content "LABEL01"
      end
    end
    context "タスク検索したとき" do
      before do
        visit new_task_url
        fill_in "Name", with: "Task01"
        fill_in "Content", with: "content01"
        fill_in "Task limit", with:"05-05-2020"
        check 'LABEL01'
        click_button "登録する"
        visit new_task_url
        fill_in "Name", with: "Task02"
        fill_in "Content", with: "content02"
        fill_in "Task limit", with:"05-05-2020"
        check 'LABEL02'
        click_button "登録する"
        visit root_path
        within "search-cell" 
        select "LABEL01", from:"Label"
        click_button "search"
      end
      it "指定したラベルを持つタスクが表示されること" do
        expect(page).to have_content "Task01"
      end
      it "指定していないラベルを持つタスクが表示されないこと" do
        expect(page).to_not have_content "Task02"
      end
    end
  end
end