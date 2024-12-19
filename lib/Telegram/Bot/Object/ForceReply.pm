package Telegram::Bot::Object::ForceReply;

# ABSTRACT: The base class for Telegram 'ForceReply' type objects

=head1 DESCRIPTION

See L<https://core.telegram.org/bots/api#forcereply> for details of the
attributes available for L<Telegram::Bot::Object::ForceReply> objects.

=cut

use Mojo::Base 'Telegram::Bot::Object::Base';

has 'force_reply'; # Boolean
has 'input_field_placeholder'; #String
has 'selective'; # Boolean

sub fields {
  return { scalar => [qw/force_reply input_field_placeholder selective/],
         };
}

1;
