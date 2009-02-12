
package EmailRetitler;

sub retitle {
    MT->log('O HAI SENDING MAIL!!!');
    my ($cb, %params) = @_;
    my ($headers, $body_ref) = @params{qw( headers body )};

    if ($$body_ref =~ s{ \A Subject: [ \t]* ([^\r\n]+) [\r\n]* }{}xms) {
        my $subject = $1;
        $headers->{Subject} = $subject;
    }

    return 1;
}

1;
