require 'classifier'

namespace :classifier do

  desc "Classify tweets for a user"
  task :bayes_user, [:user_id] => [:environment] do |t, args|
    classifier = Classifier.new
    classifier.bayesian_for_user(args[:user_id])
  end

end