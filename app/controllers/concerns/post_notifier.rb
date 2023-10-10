# Sending an email to all users when a new post is created

module PostNotifier
  extend ActiveSupport::Concern

  included do 
    after_action :notify_users, only: [:create]
  end

  private 
    def notify_users
      if @post.persisted?
        puts "Sending notification or email to all users..."
        User.all.each do |user|
          PostMailer.new_post_email(user, @post).deliver_later
        end
      end
    end

end