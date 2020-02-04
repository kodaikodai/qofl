require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid 重複したメールアドレスは無効" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid nicknameが10文字以上は無効" do
      user = build(:user, nickname: "aaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 9 characters)")
    end

    it "is valid nicknameが9文字以上は有効" do
      user = build(:user, nickname: "aaaaaaaaa")
      expect(user).to be_valid
    end

    it "is valid passwordが6文字以上は有効" do
      user = build(:user, password:"aaaaaa",password_confirmation: "aaaaaa")
      expect(user).to be_valid
    end

    it "is invalid passwordが5文字以下は無効" do
      user = build(:user, password: "aaaaa")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end
