name             'sun-db'
maintainer       'Systems United Navy'
maintainer_email 'xist@systemsunitednavy.com'
license          'All rights reserved'
description      'Installs/Configures sun-db'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

depends "build-essential"
depends "git"
depends "mysql"
depends "apache2"
depends "logrotate"
depends "php"
