class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail to: "roadfox303@gmail.com", subject: "お問い合わせの確認メール"
  end
  # def notice_mail(user)
  #   @user = user
  #   mail(
  #     subject: "画像を投稿しました", #メールのタイトル
  #     to: @user.email #宛先
  #   ) do |format|
  #     format.text
  #   end
  # end
  def notice_mail(notice)
    @user = notice
    mail to: @user.email, subject: "画像を投稿しました"
  end

end
