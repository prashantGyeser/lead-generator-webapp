
class Dashboard::LeadsController < Dashboard::ApplicationController
  def index

    if current_user.authorized_application == true
      @leads = UserLead.where(:user_id => current_user.id).order("created_at desc")

      # Delete this
      # Create an IronMQ::Client object
      @ironmq = IronMQ::Client.new()

# Get a queue (if it doesn't exist, it will be created when you first post a message)
      @queue = @ironmq.queue("my_queue")

# Post a message
      @queue.post("hello world!")

# Get a message
      msg = @queue.get()
      p msg

# Delete a message (you must delete a message when you're done with it or it will go back on the queue after a timeout)
      msg.delete # or @queue.delete(msg.id)


    else
      session[:user_id] = current_user.id
      @application_not_authorized = true
    end


  end
end
