use warnings;

use Test::More tests => 4;

use HTTP::Retry qw(http);

my $resp1 = http('url' => "http://www.example.com");
is($resp1->{status} , 200);

my $resp2 = http('url' => "http://www.example.com", 'timeout' => 3, 'retry' => 3);
like($resp2->{content}, qr/Example Domain/);

my $resp3 = http("http://www.example.com");
is($resp3->{status} , 200);
like($resp3->{content}, qr/Example Domain/);
