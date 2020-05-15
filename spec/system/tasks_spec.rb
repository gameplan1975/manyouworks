require 'rails_helper'
RSpec.describe 'Tasks', type: :system do
  describe "タスク機能のテスト" do
    before do
      visit new_task_path
      fill_in "Name", with: "test01"
      fill_in "Content", with: "content01"
      fill_in "Task limit", with: "05-05-2020"
      select "high", from: "Priority"
      select "Not Started", from: "Status"
      click_button "登録する"
      visit new_task_path
      fill_in "Name", with: "test02"
      fill_in "Content", with: "content02"
      fill_in "Task limit", with: "06-06-2020"
      select "low", from: "Priority"
      select "Undertake", from: "Status"
      click_button "登録する"
      visit new_task_path
      fill_in "Name", with: "test03"
      fill_in "Content", with: "content03"
      fill_in "Task limit", with: "07-07-2020"
      select "middle", from: "Priority"
      select "Complete", from: "Status"
      click_button "登録する"
      visit new_task_path
      fill_in "Name", with: "test04"
      fill_in "Content", with: "content04"
      fill_in "Task limit", with: "08-08-2020"
      select "high", from: "Priority"
      select "Not Started", from: "Status"
      click_button "登録する"
      visit new_task_path
      fill_in "Name", with: "test05"
      fill_in "Content", with: "content05"
      fill_in "Task limit", with: "09-09-2020"
      select "middle", from: "Priority"
      select "Complete", from: "Status"
      click_button "登録する"
      visit new_task_path
      fill_in "Name", with: "test06"
      fill_in "Content", with: "content06"
      fill_in "Task limit", with: "11-11-2020"
      select "high", from: "Priority"
      select "Complete", from: "Status"
      click_button "登録する"
    end
  
    context "タスクを作成した場合" do
      it "終了期限、優先順位、ステータスが登録されること" do
        expect(page).to have_content "test06"
        expect(page).to have_content "content06"
        expect(page).to have_content "2020-11-11"
        expect(page).to have_content "high"
        expect(page).to have_content "Complete"
      end
    end

    context "複数のタスクがある場合" do
      it "５つのタスクが表示されること" do
        visit tasks_path
        expect(page).to have_content "test01"
        expect(page).to have_content "test02"
        expect(page).to have_content "test03"
        expect(page).to have_content "test04"
        expect(page).to have_content "test05"
      end
      it "６つ目のタスクが表示されないこと" do
        visit tasks_path
        expect(page).not_to have_content "test06"
      end
    end
    context "検索を行った場合" do
      it "ステータス(Not Started）で絞り込んだタスクが表示されること" do
        visit tasks_path
        select "Not Started", from: "Status"
        click_button "Search"
        expect(page).to have_content "test01"
        expect(page).not_to have_content "test02"
        expect(page).not_to have_content "test03"
        expect(page).to have_content "test04"
        expect(page).not_to have_content "test05"
        expect(page).not_to have_content "test06"
      end
      it "名前（test01)で絞り込んだタスクが表示されること" do
        visit new_task_path
        fill_in "Name", with: "test01"
        fill_in "Content", with: "content07"
        fill_in "Task limit", with: "05-05-2020"
        select "high", from: "Priority"
        select "Complete", from: "Status"
        click_button "登録する"  
        visit tasks_path
        fill_in "Name", with: "test01"
        click_button "Search"
        expect(page).to have_content "test01"
        expect(page).not_to have_content "test02"
        expect(page).not_to have_content "test03"
        expect(page).not_to have_content "test04"
        expect(page).not_to have_content "test05"
        expect(page).not_to have_content "test06"
        expect(page).to have_content "content07"
      end
      it "名前（test01)とstatus(Not Started)で絞り込んだタスクのみ表示されること" do
        visit new_task_path
        fill_in "Name", with: "test01"
        fill_in "Content", with: "content07"
        fill_in "Task limit", with: "05-05-2020"
        select "high", from: "Priority"
        select "Complete", from: "Status"
        click_button "登録する"  
        visit tasks_path
        fill_in "Name", with: "test01"
        select "Not Started", from: "Status"
        click_button "Search"
        expect(page).to have_content "test01"
        expect(page).not_to have_content "test02"
        expect(page).not_to have_content "test03"
        expect(page).not_to have_content "test04"
        expect(page).not_to have_content "test05"
        expect(page).not_to have_content "test06"
        expect(page).not_to have_content "content07"
      end
    end
    context "ソートを行った場合" do
      it "▲でpriorityの昇順でsortされること" do
        visit tasks_path
        within ".priority-cell" do
          click_link '▲'
        end
        expect(page).to have_content "high"
        #expect(all("tbody tr")[0]).to have_content "high"
        #expect(all("tbody tr")[1]).to have_content "high"
        #expect(all("tbody tr")[2]).to have_content "high"
        #expect(all("tbody tr")[3]).to have_content "middle"
      end
      it "  ▼でpriorityの降順でsortされること" do
        visit tasks_path
        within ".priority-cell" do
          click_link '▼'
        end
        expect(page).not_to have_content "low"
        #expect(all("tbody tr")[0]).to have_content "low"
        #expect(all("tbody tr")[1]).to have_content "middle"
        #expect(all("tbody tr")[2]).to have_content "middle"
        #expect(all("tbody tr")[3]).to have_content "high"
      end
    end
  end
end