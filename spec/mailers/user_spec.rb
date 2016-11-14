require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "signup" do
    let(:user) { User.create(email: 'to@example.org') }
    let(:mail) { UserMailer.signup(user)}

    it "renders the headers" do

      expect(mail.subject).to eq("Signup")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["hello@hms.xxxx.pl"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Zarejestrowali")
    end
  end
end
