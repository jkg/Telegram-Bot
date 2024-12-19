package Telegram::Bot::Object::ForceReplyMarkup;

# ABSTRACT: The base class for Telegram 'ForceReplyMarkup' type objects

=head1 DESCRIPTION

See L<https://core.telegram.org/bots/api#forcereply> for details of the
attributes available for L<Telegram::Bot::Object::ForceReplyMarkup> objects.

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
