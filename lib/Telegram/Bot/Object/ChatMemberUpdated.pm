package Telegram::Bot::Object::ChatMemberUpdated;

# ABSTRACT: The base class for the Telegram type "ChatMemberUpdated".

=head1 DESCRIPTION

See L<https://core.telegram.org/bots/api#chatmemberupdated> for details of the
attributes available for L<Telegram::Bot::Object::ChatMemberUpdated> objects.

=cut

use Mojo::Base 'Telegram::Bot::Object::Base';

use Telegram::Bot::Object::User;
use Telegram::Bot::Object::Chat;

use Data::Dumper;

# basic message stuff
has 'chat'; # Chat
has 'from'; # User

has 'date';  # Integer

sub fields {
  return {
          'scalar'                                      => [qw/date/],
          'Telegram::Bot::Object::User'                 => [qw/from/],

          'Telegram::Bot::Object::Chat'                 => [qw/chat/],
  };
}

sub arrays {
}

=method

Convenience methods

=cut

sub approve {
  my $self = shift;
  my $text = shift;
  return $self->_brain->approveChatMemberUpdated({chat_id => $self->chat->id, user_id => $self->from->id});
}

sub decline {
  my $self = shift;
  my $text = shift;
  return $self->_brain->declineChatMemberUpdated({chat_id => $self->chat->id, user_id => $self->from->id});
}

1;
