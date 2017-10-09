# ubuntu-installation-recipes

This will be a 'putting it all together' library cookbook for Linux Ubuntu Server. There will be multiple recipes:
* Install a GUI and xrdp to allow remote access from a windows rdp session
  * recipe: install-gui
* Install and configure Samba for a fully open share (file transfer)
  * recipe: install-samba
* Install a web server and set up a Server Info page that consumes automatic/Ohai/Fauxhai attributes.
  * recipe: server-info-web

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

### command to run in library cookbook
```
chef generate recipe install-gui
```

###  recipe in the kitchen cookbook
```
include_recipe 'ubuntu-installation-recipes::install-gui'
```

### default_spec (unit) in kitchen cookbook
* See spec/unit/recipes/install-gui_spec.rb
* Include the tests here in the wrapper cookbook as necessary

### default_test (integration) in kitchen cookbook
* See test/smoke/default/install-gui_test.rb
* Include the tests here in the wrapper cookbook as necessary
```diff
-At this time I have no integration test for apt_update
```

### install-gui (recipe) in library cookbook
* See recipes/install-gui.rb

## install-samba

### commands to run in library cookbook
```
chef generate recipe install-samba
chef generate file smb.conf
```

###  recipe in the kitchen cookbook
```
include_recipe 'ubuntu-installation-recipes::install-samba'
```

### default_spec (unit) in kitchen cookbook
* See spec/unit/recipes/install-samba_spec.rb
* Include the tests here in the wrapper cookbook as necessary

### default_test (integration) in kitchen cookbook
* See test/smoke/default/install-samba_test.rb
* Include the tests here in the wrapper cookbook as necessary

### install-samba (recipe) in library cookbook
* See recipes/install-gui.rb

## server-info-web

### commands to run in library cookbook
```
chef generate recipe server-info-web
chef generate template server-info-web.html
```

###  recipe in the kitchen cookbook
```
include_recipe 'ubuntu-installation-recipes::server-info-web`
```

### default_spec (unit) in kitchen cookbook
* See spec/unit/recipes/server-info-web_spec.rb
* Include the tests here in the wrapper cookbook as necessary

### default_test (integration) in kitchen cookbook
* See test/smoke/default/server-info-web_test.rb
* Include the tests here in the wrapper cookbook as necessary

### install-samba (recipe) in library cookbook
* See recipes/server-info-web.rb