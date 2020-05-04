require 'rails_helper'
RSpec.describe 'Tasks', type: :system do
  describe "タスク機能のテスト" do
    before do
      visit new_task_path
      fill_in "Name", with: "test01"
      fill_in "Content", with: "content01"
      click_button "Create Task"
    end
  
    context "タスクを作成した場合" do
      it "投稿した内容が表示されること" do
        expect(page).to have_content "test01"
        expect(page).to have_content "content01"
      end
    end

    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存される' do
       expect(page).to have_contｚent "Task was successfully created."
      end   
    end

    context '任意のタスク詳細画面に遷移した場合' do
        it '該当タスクの内容が表示されたページに遷移する' do
            visit current_path
            expect(page).to have_content "test01"
      end
    end

    context "２つ目のタスクを作成した場合" do
        it "２つ目の投稿が１つ目より先に表示されること" do
          visit new_task_path
          fill_in "Name", with: "test02"
          fill_in "Content", with: "content02"
          click_button "Create Task"
          expect(page).to have_content "test02"
          expect(page).to have_content "test01"
        end
      end



  end
end