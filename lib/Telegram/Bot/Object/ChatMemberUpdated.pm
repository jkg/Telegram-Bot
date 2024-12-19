package Telegram::Bot::Object::ChatMemberUpdated;

# ABSTRACT: The base class for the Telegram type "ChatMemberUpdated".

=head1 DESCRIPTION

See L<https://core.telegram.org/bots/api#chatmemberupdated> for details of the
attributes available for L<Telegram::Bot::Object::ChatMemberUpdated> objects.

=cut

use Mojo::Base 'Telegram::Bot::Object::Base';

use Telegram::Bot::Object::ChatMember;

use Data::Dumper;

# basic message stuff

has 'chat'; # Chat
has 'from'; # User
has 'date';  # Integer
has 'new_chat_member';                  # ChatMember
has 'old_chat_member';                  # ChatMember
has 'invite_link';                      # ChatInviteLink
has 'via_join_request';                 # boolean
has 'via_chat_folder_invite_link';      # boolean

sub fields {
  return {
          'scalar'                                      => [qw/date via_join_request via_chat_folder_invite_link/],
          'Telegram::Bot::Object::User'                 => [qw/from/],
          'Telegram::Bot::Object::Chat'                 => [qw/chat/],
          'Telegram::Bot::Object::ChatMember'           => [qw/new_chat_member old_chat_member /],
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
