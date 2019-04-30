#!/bin/bash

VERSION_BIU=2.3.5
VERSION_GECODE=1.3.0.1
VERSION_CPSP=2.4.7

MAKE_JOBS=4

#########################################
echo " set up install pathes";
#########################################

export INSTALL_PATH=$HOME/CPSP-bundle-$VERSION_CPSP
export INSTALL_CPSP_COREDB=$HOME/CPSP_cores

#########################################
# function for error handling
#########################################

function error_exit
{
    echo ${1:-"Unknown Error"} 1>&2
    exit 1
}


#########################################
echo " make and install Gecode library";
#########################################

tar -xzf gecode-$VERSION_GECODE.tar.gz || error_exit "Error while unpacking gecode-$VERSION_GECODE.tar.gz";
cd gecode-$VERSION_GECODE;
CXXFLAGS="-fpermissive -Wno-nonnull-compare" ./configure --enable-static --disable-shared --disable-set-vars --disable-examples --prefix=$INSTALL_PATH || (cd ..; error_exit "Configure of gecode-$VERSION_GECODE failed!");
make -j $MAKE_JOBS || (cd ..; error_exit "Compilation of gecode-$VERSION_GECODE failed!");
make install || (cd ..; error_exit "Installation of gecode-$VERSION_GECODE failed!");
cd ..;

#########################################
echo " make and install BIU library";
#########################################

tar -xzf biu-$VERSION_BIU.tar.gz || error_exit "Error while unpacking biu-$VERSION_BIU.tar.gz";
cd biu-$VERSION_BIU;
./configure --prefix=$INSTALL_PATH || (cd ..; error_exit "Configure of biu-$VERSION_BIU failed!");
make -j $MAKE_JOBS || (cd ..; error_exit "Compilation of biu-$VERSION_BIU failed!");
make install || (cd ..; error_exit "Installation of biu-$VERSION_BIU failed!");
cd ..;

#########################################
echo " make and install CPSP package";
#########################################

tar -xzf cpsp-$VERSION_CPSP.tar.gz || error_exit "Error while unpacking cpsp-$VERSION_CPSP.tar.gz";
cd cpsp-$VERSION_CPSP;
CXXFLAGS="-Wno-deprecated" ./configure --enable-static-linking --with-BIU=$INSTALL_PATH --with-gecode=$INSTALL_PATH --prefix=$INSTALL_PATH || (cd ..; error_exit "Configure of cpsp-$VERSION_CPSP failed!");
make -j $MAKE_JOBS || (cd ..; error_exit "Compilation of cpsp-$VERSION_CPSP failed!");
make install || (cd ..; error_exit "Installation of cpsp-$VERSION_CPSP failed!");
cd ..;

#########################################
echo " unzip Hcore data and install";
#########################################

mkdir -p $INSTALL_CPSP_COREDB || error_exit "Cannot create CPSP H-core folder";
tar -xzf CPSP_CoreDB.cub.all.tar.gz || error_exit "Error while unpacking CPSP_CoreDB.cub.all.tar.gz";
mv -f Cubic $INSTALL_CPSP_COREDB;
tar -xzf CPSP_CoreDB.fcc.all.tar.gz || error_exit "Error while unpacking CPSP_CoreDB.fcc.all.tar.gz";
mv -f Fcc $INSTALL_CPSP_COREDB;

#########################################
echo " run HPstruct example";
#########################################

$INSTALL_PATH/bin/HPstruct -seq=HPPPHPHHHPPHHHHPHPHHPHPH -lat=CUB -allbest -maxSol=20 -distMode=MOVE -distMin=6 -dbPath=$INSTALL_CPSP_COREDB -normalize || error_exit "Test run of HPstruct failed!";

#########################################
echo " all done ...";
#########################################


