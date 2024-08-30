package Telegram::Bot::Object::Member;

# ABSTRACT: The base class for Telegram message 'Member' type.

=head1 DESCRIPTION

See L<https://core.telegram.org/bots/api#chatmember> for details of the
attributes available for L<Telegram::Bot::Object::Member> objects.

=cut

use Mojo::Base 'Telegram::Bot::Object::Base';

has 'status';
has 'user';

has 'can_be_edited';                    # optional
has 'can_change_info';                  # optional
has 'can_delete_messages';              # optional
has 'can_delete_stories';               # optional
has 'can_edit_messages';                # optional
has 'can_edit_stories';                 # optional
has 'can_invite_users';                 # optional
has 'can_manage_chat';                  # optional
has 'can_manage_video_chats';           # optional
has 'can_manage_voice_chats';           # optional
has 'can_post_messages';                # optional
has 'can_post_stories';                 # optional
has 'can_promote_members';              # optional
has 'can_restrict_members';             # optional
has 'is_anonymous';                     # optional


sub fields {
  return {
        scalar => [qw/status can_be_edited can_change_info can_delete_messages
                   can_delete_stories can_edit_messages can_edit_stories
                   can_invite_users can_manage_chat can_manage_video_chats
                   can_manage_voice_chats can_post_messages can_post_stories
                   can_promote_members can_restrict_members is_anonymous/],
        'Telegram::Bot::Object::User' => [qw/user/],
  };
}

1;