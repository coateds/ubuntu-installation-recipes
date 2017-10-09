#
# Cookbook:: ubuntu-installation-recipes
# Recipe:: install-gui
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Ruuning this recipe will install a GUI and rdp client
# When this is done use the windows RDP client to connect
# With the user/password contained in the .kitchen\[name].yml file

apt_update 'update_repo' do
  action :update
end

package 'xfce4'
package 'xrdp'