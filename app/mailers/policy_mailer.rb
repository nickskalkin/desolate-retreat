class PolicyMailer < ApplicationMailer
  def policy_email(policy)
    @policy = policy
    @user = policy.user
    mail(to: @policy.user.email, from: 'osagokasko2016@mail.ru', subject: "Оформление полиса #{@policy.serial_number} #{@policy.number} завершено")
  end
end
