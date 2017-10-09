# # encoding: utf-8

# Inspec test for recipe ubuntu-installation-recipes::install-samba

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# install-samba section
describe package('samba') do
  it { should be_installed }
end

describe directory('/smbshare') do
  it { should exist }
  its('owner') { should cmp 'root' }
  its('group') { should cmp 'root' }
  its('mode') { should eq 00777 }
end

# in its simplest form, this test will work without running the recipe
# the smb.conf will exist, but in a generic version.
# so this is a worthless test at this time
describe file('/etc/samba/smb.conf') do
  it { should exist }
end
# /install-samba section
