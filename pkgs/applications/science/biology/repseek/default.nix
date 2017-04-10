{ stdenv, fetchurl, gcc }:

stdenv.mkDerivation rec {
  name = "repseek-2014.09.09";

  src = fetchurl {
    url = "http://wwwabi.snv.jussieu.fr/public/RepSeek/RepSeek.9Sep2014.tgz";
    sha256 = "1jiknji3ivrv7zmrfbf2mccfpdwhin3lfxfsciaqwf69b3sda8nf";
  };

  installPhase = ''
	mkdir -p $out/bin
	cp -v repseek $out/bin
   '';

  patches = [
  		./RepSeek-2014.09.09.patch
  		];

  sourceRoot = "RepSeek";

  buildInputs = [ gcc ];
  
 
  meta = with stdenv.lib; {
    description = "Efficient identification of non perfect repeats in genomic sequences";
    longDescription = ''
    Chromosomes or other long DNA sequences contain many highly similar repeated 
    sub-sequences. While there are efficient methods for detecting strict repeats 
    or detecting already characterized repeats, there is no software available 
    for detecting all approximate repeats in DNA sequences allowing for gaps and 
    a substitution matrix and using a statistical framework. Here, we present an 
    implementation of a two-steps method (seed detection followed by their 
    extensions) that detects those approximate repeats. Our method is computationally 
    efficient enough to handle large sequences and is flexible enough to account 
    for influencing factors such as sequence-composition biases both at the seed 
    detection and alignment levels.
    
    RepSeek was developed by Guillaume Achaz. Feel free to contact him for support.

	If you are using the software, please cite the following manuscript :
	Achaz, Boyer, Rocha, Viari and Coissac. 
	Repseek, a tool to retrieve approximate repeats from large DNA sequences. 
	Bionformatics (2006).
    '';
    homepage = http://wwwabi.snv.jussieu.fr/public/RepSeek;
    license = licenses.lgpl21;
    maintainers = [ maintainers.metabar ];
  };
}



