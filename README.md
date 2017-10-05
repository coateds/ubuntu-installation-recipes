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

### default recipe in the kitchen cookbook
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
# Ruuning this recipe will install a GUI and rdp client
# When this is done use the windows RDP client to connect
# With the user/password contained in the .kitchen\[name].yml file

apt_update 'update_repo' do
  action :update
end

package 'xfce4'
package 'xrdp'
```