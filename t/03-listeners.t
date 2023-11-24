use strict; use warnings;

use Test::More;
use Test::Warn;
use Telegram::Bot::Brain;

my $bot = Telegram::Bot::Brain->new();

my $runcounter = 0;
my $msg = { message_id => 123457, text => "boop", date => 12346, from => { id => 444 } };

subtest add_listener => sub {
    $bot->add_listener( sub { shift; $runcounter++ if shift->text =~ /hello/ } );
    $msg->{text} = "hello";
    $bot->_process_message( { message => $msg } );

    is $runcounter, 1
        => "Added listener was executed";
    $runcounter = 0;

    $bot->add_listener(sub { shift; $runcounter++ if length(shift->text) >= 10 } );
    $msg->{text} = "hellothere";
    $bot->_process_message( { message => $msg } );

    is $runcounter, 2 # 2 because both listeners match
        => "When we have two listeners, both are executed";
    $runcounter = 0;

    $msg->{text} = "facetiously";
    $bot->_process_message( { message => $msg } );

    is $runcounter, 1 # 1 because only second listener matches
        => "And the listeners do have their individual behaviours";
    $runcounter = 0;
};

subtest message_types => sub {

    $bot->_process_message( { edited_message => $msg } );
    is $runcounter, 1
        => "Edited messages still trigger the listener";
    $runcounter = 0;

    warning_like { $bot->_process_message( { some_unknown_field => $msg } ) } qr/know how to handle/
        => 'Warns correctly about the unexpected message type';

    is $runcounter, 0
        => "... but doesn't do anything, since no listener was invoked";

};

done_testing();