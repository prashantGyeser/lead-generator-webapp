
class Dashboard::LeadsController < Dashboard::ApplicationController
  def index

    if current_user.authorized_application == true
      @leads = UserLead.where(:user_id => current_user.id).order("created_at desc")

      # Delete this
      # Create an IronMQ::Client object
      @ironmq = IronMQ::Client.new()

      # Get a queue (if it doesn't exist, it will be created when you first post a message)
      @queue = @ironmq.queue("new_user_queue")

      user = User.find(2)
      token = Token.find_by_user_id(user.id)

      message_to_post_to_queue = "#{user.email},#{token.oauth_token},#{token.oauth_secret}"

      # Post a message
      @queue.post(message_to_post_to_queue)

      ptype = :multicast
      subscribers = [
          {:url => "http://localhost:4000/users/create"}
      ]


      # Delete a message (you must delete a message when you're done with it or it will go back on the queue after a timeout)
      #msg.delete # or @queue.delete(msg.id)


    else
      session[:user_id] = current_user.id
      @application_not_authorized = true
    end


  end
end
