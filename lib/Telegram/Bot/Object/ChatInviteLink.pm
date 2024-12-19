package Telegram::Bot::Object::ChatInviteLink;

# ABSTRACT: The base class for the Telegram type "ChatInviteLink".

=head1 DESCRIPTION

See L<https://core.telegram.org/bots/api#chatinvitelink> for details of the
attributes available for L<Telegram::Bot::Object::ChatInviteLink> objects.

=cut

use Mojo::Base 'Telegram::Bot::Object::Base';

use Telegram::Bot::Object::User;

use Data::Dumper;

# basic message stuff
has 'creator'; # User

has 'invite_link'; # String
has 'creates_join_request';  # Boolean
has 'is_primary'; # Boolean
has 'is_revoked'; # Boolean
has 'name'; # String
has 'expire_date'; # Integer
has 'member_limit'; # Integer
has 'pending_join_request_count'; # Integer

sub fields {
  return {
          'scalar'                                      => [qw/invite_link creates_join_request is_primary is_revoked name expire_date member_limit pending_join_request_count/],
          'Telegram::Bot::Object::User'                 => [qw/creator/],
  };
}

sub arrays {
}

=method

Convenience methods

=cut

1;
