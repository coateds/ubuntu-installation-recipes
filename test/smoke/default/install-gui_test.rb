# # encoding: utf-8

# Inspec test for recipe ubuntu-installation-recipes::install-gui

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# install-gui section
describe package('xfce4') do
  it { should be_installed }
end

describe package('xrdp') do
  it { should be_installed }
end
# /install-gui section
