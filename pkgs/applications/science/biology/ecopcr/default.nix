{ stdenv, fetchurl, gcc, zlib }:

stdenv.mkDerivation rec {
  name = "ecoPCR-0.7.0";

  src = fetchurl {
    url = "https://git.metabarcoding.org/obitools/ecopcr/uploads/f51c8347db70a79f6642db0f45774c2a/ecoPCR.tar.gz";
    sha256 = "1svy7akxx25ixfqlsl92yyxs7iyn44rwksgqskmlsraq85kf56d3";
  };

  sourceRoot = "ecoPCR/src";

  buildInputs = [ gcc zlib ];

  installPhase = ''
	mkdir -p $out/bin
	cp -v ecoPCR $out/bin
  '';

  meta = with stdenv.lib; {
    description = "Electronic PCR software tool";
    longDescription = ''
      ecoPCR is an electronic PCR software developed by the LECA. It
      helps you estimate Barcode primers quality. In conjunction with
      OBITools, you can postprocess ecoPCR output to compute barcode
      coverage and barcode specificity. New barcode primers can be
      developed using the ecoPrimers software.
    '';
    homepage = https://git.metabarcoding.org/obitools/ecopcr/wikis/home;
    license = licenses.cecill20;
    maintainers = [ maintainers.metabar ];
  };
}
