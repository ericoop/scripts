#!/bin/sh
source ./version.sh
CMD_PHPIZE=/usr/local/cellar/php${suffix}/bin/phpize
CMD_PHPCONFIG=/usr/local/cellar/php${suffix}/bin/php-config
SRC_DIR=~/Downloads
yar() {
    cd $SRC_DIR
    wget https://pecl.php.net/get/yar-$YAR_V.tgz
    tar zxvf yar-$YAR_V.tgz
    cd yar-$YAR_V
    $CMD_PHPIZE
	./configure --with-php-config=$CMD_PHPCONFIG;make;make install
}

yaf() {
	cd $SRC_DIR
  wget http://pecl.php.net/get/yaf-$YAF_V.tgz 
	tar zxvf yaf-$YAF_V.tgz
	cd yaf-$YAF_V
	$CMD_PHPIZE 
	./configure --with-php-config=$CMD_PHPCONFIG;make;make install
}

zmq() {
	cd $SRC_DIR
	#libzeromq
	git clone https://github.com/zeromq/zeromq2-x.git
	cd zeromq2-x
	yum install libtool -y
	./autogen.sh
	yum -y install libuuid-devel
	./configure --with-pgm;make;make install
	#php-zmq
	cd $SRC_DIR
	git clone git://github.com/mkoppanen/php-zmq.git
	cd php-zmq
	$CMD_PHPIZE
	./configure --with-php-config=$CMD_PHPCONFIG;make;make install
}

igbinary() {
	cd $SRC_DIR
	wget https://github.com/igbinary/igbinary/archive/$IG_V.tar.gz 
	tar zxvf $IG_V.tar.gz
	cd igbinary-$IG_V
  $CMD_PHPIZE 
	./configure --with-php-config=$CMD_PHPCONFIG;make;make install
}

redis() {
	cd $SRC_DIR
	git clone git://github.com/nicolasff/phpredis.git
	cd phpredis
	$CMD_PHPIZE
	./configure --enable-redis-igbinary --with-php-config=$CMD_PHPCONFIG;make;make install
}
pb() {
  cd $SRC_DIR
  wget http://pecl.php.net/get/protobuf-$PB_V.tgz
  tar zxvf protobuf-$PB_V.tgz
  cd protobuf-$PB_V
  $CMD_PHPIZE
  ./configure --with-php-config=$CMD_PHPCONFIG;make;make install
}

all() {
	yaf
	zmq
	igbinary
	redis
  pb
}

case $1 in
   yaf)
		 yaf
    ;;
   yar)
       yar
    ;;
   zmq)
		 zmq
    ;;
	 igbinary)
		 igbinary
		;;
	 redis)
		 redis
		 ;;
   pb)
     pb
     ;;
	 all)
		all
		;;
   *)
    echo 'yaf|yar|zmq|igbinary|redis|pb|all'
    ;;
esac
	


