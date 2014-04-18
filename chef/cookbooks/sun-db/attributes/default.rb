# Override Apache settings

override['apache']['contact'] = 'xist@systemsunitednavy.com'

override['apache']['prefork']['startservers']           = 2
override['apache']['prefork']['minspareservers']        = 2
override['apache']['prefork']['maxspareservers']        = 8
override['apache']['prefork']['serverlimit']            = 10
override['apache']['prefork']['maxclients']             = 10
override['apache']['prefork']['maxrequestsperchild']    = 10000

# Set up default Mysql permissions

override['mysql']['server_root_password'] = 'vagrant'
override['mysql']['server_repl_password'] = 'vagrant'
override['mysql']['server_debian_password'] = 'vagrant'
override['mysql']['bind_address'] = '0.0.0.0'
