require 'rails_helper'

module HisAdapter
  RSpec.describe Post, type: :model do
    describe "测试一下是否正常使用" do 
      post = FactoryBot.create(:post)
      p post.title
    end
  end
end
