require "bunny"

# Start a communication session with RabbitMQ
# conn = Bunny.new
conn = Bunny.new(:user => 'guest', :password => 'guest', port: 5672, host: '10.0.2.15')
# conn = Bunny.new('amqp://adamc:guest@10.0.2.15:15672')
conn.start

# open a channel
ch = conn.create_channel

# declare a queue
q  = ch.queue("test1")

# publish a message to the default exchange which then gets routed to this queue
q.publish("Hello, everybody!")

# fetch a message from the queue
delivery_info, metadata, payload = q.pop

puts "This is the message: #{payload}"

# close the connection
conn.stop