# to encrypt a secret, use BCrypt::Password.create(secret)
# to test a secret, use BCrypt::Password.new(encrypted) == secret
# run this file using rails runner scripts/encryption.rb

# TODO:
# 1. encrypt a secret and puts encrypted string
password = "puppies"
pass_encrypt = BCrypt::Password.create(password)
puts pass_encrypt

# 2. prepare encrypted string for testing
new_encrypt = BCrypt::Password.new(pass_encrypt)
puts new_encrypt

# 3. test secret against prepared encrypted string
user_entered_password = "kittens"
puts new_encrypt == "puppies" #this is the unencrypted password they are sending
