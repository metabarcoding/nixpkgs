# Clean the environment
source $stdenv/setup

# Add the needed packages to build to the environment
PATH=$gcc/bin:$PATH
PATH=$zlib/bin:$PATH

# The Makefile is in the src directory so the buildPhase() function needs
# to be redefined
buildPhase() {
	cd src
	make
}

# There is no install in the Makefile so the installPhase() function needs
# to be redefined
installPhase() {
	mkdir -p $out/bin
	cp ecoPCR $out/bin
}

genericBuild
