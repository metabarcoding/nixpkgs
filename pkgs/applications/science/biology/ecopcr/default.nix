# Function arguments: packages needed to build this one
{ stdenv, fetchurl, gcc, zlib }:

stdenv.mkDerivation rec {
  name = "ecoPCR-0.7.0";

  # The package is not built in a standard way so we refer to another builder
  builder = ./builder.sh;
  # Send packages needed to build to the builder
  buildInputs = [gcc zlib];

  # URL and checksum of the source
  src = fetchurl {
    url = "https://git.metabarcoding.org/obitools/ecopcr/uploads/f51c8347db70a79f6642db0f45774c2a/ecoPCR.tar.gz";
    sha256 = "1svy7akxx25ixfqlsl92yyxs7iyn44rwksgqskmlsraq85kf56d3";
  };

  # Meta data
  meta = {
    description = "ecoPCR is an electronic PCR software.";
    longDescription = "ecoPCR is an electronic PCR software developed by the LECA. It helps you estimate Barcode primers quality. In conjunction with OBITools, you can postprocess ecoPCR output to compute barcode coverage and barcode specificity. New barcode primers can be developed using the ecoPrimers software.";
    homepage = https://git.metabarcoding.org/obitools/ecopcr/wikis/home;
    license = stdenv.lib.licenses.cecill20;
    maintainers = [ stdenv.lib.maintainers.metabar ];
    platforms = stdenv.lib.platforms.all;
  };
}

