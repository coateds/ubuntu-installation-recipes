# ubuntu-installation-recipes

This will be a 'putting it all together' library cookbook for Linux Ubuntu Server. There will be multiple recipes:
* Install a GUI and xrdp to allow remote access from a windows rdp session
  * recipe: install-gui
* Install and configure Samba for a fully open share (file transfer)
* Install a web server and set up a Server Info page that consumes automatic/Ohai/Fauxhai attributes.

For each recipe, there will be sections of the `default_spec` (unit tests) and `default_test` (integration tests)

# Log/Process
metadata.rb
```
depends 'ubuntu-installation-recipes'
```

Berksfile
```
cookbook "ubuntu-installation-recipes", path: "C:/Users/dcoate/Documents/GitRepositories/ubuntu-installation-recipes"
```

## install-gui

###  recipe in the kitchen cookbook
```
include_recipe 'ubuntu-installation-recipes::install-gui'
```

### default_spec (unit) in kitchen cookbook
```
    it 'installs xfce4' do
      expect(chef_run).to install_package('xfce4')
    end

    it 'installs xrdp' do
      expect(chef_run).to install_package('xrdp')
    end
```

### default_test (integration) in kitchen cookbook
```diff
-At this time I have no integration test for apt_update

describe package('xfce4') do
  it { should be_installed }
end

describe package('xrdp') do
  it { should be_installed }
end
```

### install-gui (recipe) in library cookbook
```
# Running this recipe will install a GUI and rdp client
# When this is done use the windows RDP client to connect
# With the user/password contained in the .kitchen\[name].yml file

apt_update 'update_repo' do
  action :update
end

package 'xfce4'
package 'xrdp'
```

## install-samba

### command to run in library cookbook
```
chef generate file smb.conf
```

###  recipe in the kitchen cookbook
```
include_recipe 'ubuntu-installation-recipes::install-samba'
```

### default_spec (unit) in kitchen cookbook
```
    # install-samba section
    it 'installs samba' do
      expect(chef_run).to install_package('samba')
    end

    it 'creates the /samba directory with attributes' do
      expect(chef_run).to create_directory('/samba').with(
        owner:  'root',
        group:  'root',
        mode:   '0755'
      )
    end

    it 'creates the file smb.conf' do
      expect(chef_run).to create_file('/etc/samba/smb.conf')
    end
    # /install-samba section
```

### default_test (integration) in kitchen cookbook
```
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
```

### install-gui (recipe) in library cookbook
```
apt_update
package 'samba'

directory '/smbshare' do
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end

cookbook_file '/etc/samba/smb.conf' do
  source 'smb.conf'
end
```