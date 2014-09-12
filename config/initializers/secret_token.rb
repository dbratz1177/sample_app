#Be sure to restart your server when you modify this file

#The secret key is used for verifying the integrity of signed cookies.
#Changing this key makes all old signed cookies invalid!!!!

# Make sure that the secret key is at least 30 characters long and all random,
# No regular words, or you'll be exposed to dictionary attacks!
# The command 'rake secret' generates a secure secret key

# Make sure that your secret_key_base is kept private
# if you're sharing your code publicly

require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		#Use the existing token
		File.read(token_file).chomp
	else
		#Generate a new token and store it in token_file
		toke = securerandom.hex(64)
		File.write(token_file, token)
		token
	end
end

SampleApp::Application.config.secret_key_base = secure_token