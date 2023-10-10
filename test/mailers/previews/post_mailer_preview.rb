# Preview all emails at http://localhost:3000/rails/mailers/post_mailer
class PostMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/post_mailer/new_post_email
  def new_post_email()
    user = User.first
    post = Post.last
    PostMailer.new_post_email(user, post)
  end 

end
