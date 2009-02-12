
package EmailRetitler;

use MT::Mail;

my $send = \&MT::Mail::send;

my $new_send = sub {
    my ($class, $headers, $body) = @_;

    if ($body =~ s{ \A Subject: [ \t]* ([^\r\n]+) [\r\n]* }{}xms) {
        my $subject = $1;
        $headers->{Subject} = $subject;
    }

    $send->($class, $headers, $body);
};

{
    no strict 'refs';
    *MT::Mail::send = $new_send;
}

sub hi { 1 }

1;
