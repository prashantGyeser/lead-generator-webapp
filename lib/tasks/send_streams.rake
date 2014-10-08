require 'send_lead_streams'

namespace :export do
  desc "Sends all the unique lead streams to the processor"
  task lead_streams: :environment do
    send_lead_streams = SendLeadStreams.new
    send_lead_streams.send_unique_streams
  end
end