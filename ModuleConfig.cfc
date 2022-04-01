component {
    function configure() {

    }
    function onLoad() {
        wirebox.getInstance( 'FileSystem' )
            .classLoad( expandPath( '/commandbox-certbox/lib' ) );
    }
    function preCommand() {
        systemoutput( 'Reloading cert module',1 );
        pagePoolClear();
        wirebox.getInstance( 'moduleService' ).reload( 'commandbox-certbox' );
    }
}