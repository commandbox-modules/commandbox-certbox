component {
    function run() {

        createObject( 'java', 'java.security.Security' ).addProvider( createObject( 'java', 'org.bouncycastle.jce.provider.BouncyCastleProvider' ).init() );

        var ACMESession = createObject( 'java', 'org.shredzone.acme4j.Session' ).init("acme://letsencrypt.org");
        // TODO setProxy()
        // https://shredzone.org/maven/acme4j/usage/session.html#network-settings


        var keyPairUtils = createObject( 'java', 'org.shredzone.acme4j.util.KeyPairUtils' );
        var accountKeyPair = KeyPairUtils.createKeyPair( 2048 );

        var authFolder = expandPath( '/commandbox-certbox/auth/' );
        directoryCreate( authFolder, true, true );
        try {
            var fileWriter = createObject( 'java', 'java.io.FileWriter' ).init( authFolder & 'keypair.pem' );
            keyPairUtils.writeKeyPair( accountKeyPair, fileWriter );
        } finally {
            if( !isNull( fileWriter ) ) {
                fileWriter.close();
            }
        }

        print.line( accountKeyPair );
    }
}