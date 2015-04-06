ActionMailer::Base.smtp_settings = {
    :port =>           '587',
    :address =>        'smtp.mandrillapp.com',
    :user_name =>      ENV['STANDALONE_MANDRILL_USERNAME'],
    :password =>       ENV['STANDALONE_MANDRILL_APIKEY'],
    :domain =>         'heroku.com',
    :authentication => :plain
}
