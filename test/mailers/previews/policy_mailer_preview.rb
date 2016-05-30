# Preview all emails at http://localhost:3000/rails/mailers/policy_mailer
class PolicyMailerPreview < ActionMailer::Preview
  def test()
    PolicyMailer.policy_email(Policy.last)
  end
end
