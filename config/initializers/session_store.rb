# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_highguard_session',
  :secret      => 'db026757d9db2a2342b8ec5b991af76c706434bfe8c31b6e2add5efbf9c0dd91a41e1b89961644f9acda278eff649c11b0449106240ff6cd8a0765e29e9aa2b7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
