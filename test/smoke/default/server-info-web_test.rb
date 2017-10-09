# # encoding: utf-8

# Inspec test for recipe ubuntu-installation-recipes::server-info-web

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# server-info section
describe package('apache2') do
  it { should be_installed }
end

describe file('/var/www/html/index.html') do
  it { should exist }
  its('content') { should eq '<h1>My home page</h1>
<a href="server-info.html">Link to server-info</a>' }
end

describe file('/var/www/html/server-info.html') do
  it { should exist }
end
# /server-info section
