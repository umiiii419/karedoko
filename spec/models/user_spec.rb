# frozen_string_literal: true

require 'rails_helper'

describe 'Userモデルのテスト' do
  it "有効な投稿内容の場合は保存されるか" do
    expect(FactoryBot.build(:user)).to.be_vaild
  end
end
