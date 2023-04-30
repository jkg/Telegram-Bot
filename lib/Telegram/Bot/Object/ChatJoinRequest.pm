package Telegram::Bot::Object::ChatJoinRequest;

# ABSTRACT: The base class for the Telegram type "ChatJoinRequest".

=head1 DESCRIPTION

See L<https://core.telegram.org/bots/api#chatjoinrequest> for details of the
attributes available for L<Telegram::Bot::Object::ChatJoinRequest> objects.

=cut

use Mojo::Base 'Telegram::Bot::Object::Base';

use Telegram::Bot::Object::User;
use Telegram::Bot::Object::Chat;
use Telegram::Bot::Object::ChatInviteLink;

use Data::Dumper;

# basic message stuff
has 'chat'; # Chat
has 'from'; # User

has 'user_chat_id'; # Integer
has 'date';  # Integer
has 'bio'; # String
has 'invite_link'; # ChatInviteLink

sub fields {
  return {
          'scalar'                                      => [qw/user_chat_id date bio/],
          'Telegram::Bot::Object::User'                 => [qw/from/],

          'Telegram::Bot::Object::Chat'                 => [qw/chat/],

          'Telegram::Bot::Object::ChatInviteLink'       => [qw/invite_link/],
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
  return $self->_brain->approveChatJoinRequest({chat_id => $self->chat->id, user_id => $self->from->id});
}

sub decline {
  my $self = shift;
  my $text = shift;
  return $self->_brain->declineChatJoinRequest({chat_id => $self->chat->id, user_id => $self->from->id});
}

1;
