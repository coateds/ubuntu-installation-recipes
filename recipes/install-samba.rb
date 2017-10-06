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