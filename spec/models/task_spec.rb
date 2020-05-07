require 'rails_helper'
describe "バリデーションのチェック" do
  it "タスク名が無ければ無効であること" do
    task = Task.new(
      content: 'content03'
    )
    expect(task).to be_invalid
  end
  it "内容が入っていなければ無効であること" do
    task = Task.new(
      name: 'task03',
    )
    expect(task).to be_invalid
  end
  it "タスク名と内容が入っていれば有効であること" do
    task = Task.new(
      name: 'task03',
      content: 'content03'
    )
    expect(task).to be_valid
  end
end