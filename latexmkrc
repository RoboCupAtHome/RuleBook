$pdf_previewer = "start okular";

add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
    my ($base_name, $path) = fileparse( $_[0] ); #handle -outdir param by splitting path and file, ...
    pushd $path; # ... cd-ing into folder first, then running makeglossaries ...

    if ( $silent ) {
        my $return = system "makeglossaries -q '$base_name'"; 
    }
    else {
        my $return = system "makeglossaries '$base_name'"; 
    };

    popd; # ... and cd-ing back again
    return $return;
}

add_cus_dep('glo', 'gls', 0, 'run_makeind');
add_cus_dep('acn', 'acr', 0, 'run_makeind');
sub run_makeind {
    my ($base_name, $path) = fileparse( $_[0] ); #handle -outdir param by splitting path and file, ...
    pushd $path; # ... cd-ing into folder first, then running makeglossaries ...
    my $dest = $$Pdest;

    if ( $silent ) {
        my $return = system "makeindex -q -o \"$dest\" '$base_name'"; 
    }
    else {
        my $return = system "makeindex -o \"$dest\" '$base_name'"; 
    };

    popd; # ... and cd-ing back again
    return $return;
}


# Compile the nomenclature (package 'nomencl')
add_cus_dep( 'nlo', 'nls', 0, 'makenlo2nls' );
sub makenlo2nls {
    my ($base_name, $path) = fileparse( $_[0] );
    pushd $path;
    my $dest = $$Pdest;
    system( "makeindex -s nomencl.ist -o \"$dest\" \"$base_name\"" );
    popd;
    return $return;
}
