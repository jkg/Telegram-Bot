package Telegram::Bot::Object::ReplyParameters;

# ABSTRACT: The base class for Telegram 'ReplyParameters' type objects

=head1 DESCRIPTION

See L<https://core.telegram.org/bots/api#replyparameters> for details of the
attributes available for L<Telegram::Bot::Object::ReplyParameters> objects.

=cut

use Mojo::Base 'Telegram::Bot::Object::Base';

has 'message_id';
has 'chat_id'; # Optional (if it came from a different chat)
has 'allow_sending_without_reply'; # Boolean

sub fields {
  return { scalar => [qw/message_id chat_id allow_sending_without_reply/]
         };
}

1;
