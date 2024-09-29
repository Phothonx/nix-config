{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.vesktop;
in {
  options.programs.vesktop = {
    enable = mkEnableOption "Enable vesktop discord client";
  };

  config = mkIf cfg.enable {
    home.packages = [pkgs.vesktop];

    xdg.configFile."vesktop/settings/settings.json".text = ''
      {
        "autoUpdate": false,
        "autoUpdateNotification": false,
        "useQuickCss": true,
        "themeLinks": [ "https://catppuccin.github.io/discord/dist/catppuccin-mocha-mauve.theme.css" ],
        "enabledThemes": [],
        "enableReactDevtools": false,
        "frameless": false,
        "transparent": false,
        "winCtrlQ": false,
        "disableMinSize": false,
        "winNativeTitleBar": false,
        "plugins": {
            "BadgeAPI": {
                "enabled": true
            },
            "ChatInputButtonAPI": {
                "enabled": true
            },
            "CommandsAPI": {
                "enabled": true
            },
            "ContextMenuAPI": {
                "enabled": true
            },
            "MemberListDecoratorsAPI": {
                "enabled": false
            },
            "MessageAccessoriesAPI": {
                "enabled": true
            },
            "MessageDecorationsAPI": {
                "enabled": false
            },
            "MessageEventsAPI": {
                "enabled": true
            },
            "MessagePopoverAPI": {
                "enabled": true
            },
            "NoticesAPI": {
                "enabled": true
            },
            "ServerListAPI": {
                "enabled": true
            },
            "NoTrack": {
                "enabled": true,
                "disableAnalytics": true
            },
            "Settings": {
                "enabled": true,
                "settingsLocation": "aboveNitro"
            },
            "SupportHelper": {
                "enabled": true
            },
            "AlwaysAnimate": {
                "enabled": false
            },
            "AlwaysTrust": {
                "enabled": true,
                "domain": true,
                "file": true
            },
            "AnonymiseFileNames": {
                "enabled": false
            },
            "WebRichPresence (arRPC)": {
                "enabled": false
            },
            "AutomodContext": {
                "enabled": false
            },
            "BANger": {
                "enabled": false
            },
            "BetterFolders": {
                "enabled": false
            },
            "BetterGifAltText": {
                "enabled": false
            },
            "BetterGifPicker": {
                "enabled": false
            },
            "BetterNotesBox": {
                "enabled": false
            },
            "BetterRoleContext": {
                "enabled": false
            },
            "BetterRoleDot": {
                "enabled": false
            },
            "BetterSessions": {
                "enabled": false
            },
            "BetterSettings": {
                "enabled": true,
                "disableFade": true,
                "eagerLoad": true
            },
            "BetterUploadButton": {
                "enabled": true
            },
            "BiggerStreamPreview": {
                "enabled": true
            },
            "BlurNSFW": {
                "enabled": true,
                "blurAmount": 10
            },
            "CallTimer": {
                "enabled": true
            },
            "ClearURLs": {
                "enabled": true
            },
            "ClientTheme": {
                "enabled": false
            },
            "ColorSighted": {
                "enabled": false
            },
            "ConsoleShortcuts": {
                "enabled": false
            },
            "CopyUserURLs": {
                "enabled": false
            },
            "CrashHandler": {
                "enabled": true
            },
            "CtrlEnterSend": {
                "enabled": false
            },
            "CustomRPC": {
                "enabled": false
            },
            "CustomIdle": {
                "enabled": false
            },
            "Dearrow": {
                "enabled": false
            },
            "Decor": {
                "enabled": false
            },
            "DisableCallIdle": {
                "enabled": false
            },
            "EmoteCloner": {
                "enabled": false
            },
            "Experiments": {
                "enabled": false
            },
            "F8Break": {
                "enabled": false
            },
            "FakeNitro": {
                "enabled": false
            },
            "FakeProfileThemes": {
                "enabled": false
            },
            "FavoriteEmojiFirst": {
                "enabled": true
            },
            "FavoriteGifSearch": {
                "enabled": true
            },
            "FixCodeblockGap": {
                "enabled": true
            },
            "FixSpotifyEmbeds": {
                "enabled": false
            },
            "FixYoutubeEmbeds": {
                "enabled": false
            },
            "ForceOwnerCrown": {
                "enabled": false
            },
            "FriendInvites": {
                "enabled": true
            },
            "FriendsSince": {
                "enabled": true
            },
            "GameActivityToggle": {
                "enabled": true,
                "oldIcon": false
            },
            "GifPaste": {
                "enabled": false
            },
            "GreetStickerPicker": {
                "enabled": false
            },
            "HideAttachments": {
                "enabled": false
            },
            "iLoveSpam": {
                "enabled": false
            },
            "IgnoreActivities": {
                "enabled": false
            },
            "ImageLink": {
                "enabled": false
            },
            "ImageZoom": {
                "enabled": true
            },
            "ImplicitRelationships": {
                "enabled": false
            },
            "InvisibleChat": {
                "enabled": false
            },
            "KeepCurrentChannel": {
                "enabled": false
            },
            "LastFMRichPresence": {
                "enabled": false
            },
            "LoadingQuotes": {
                "enabled": false,
                "replaceEvents": true
            },
            "MemberCount": {
                "enabled": true,
                "memberList": true,
                "toolTip": true
            },
            "MessageClickActions": {
                "enabled": false
            },
            "MessageLatency": {
                "enabled": true,
                "latency": 2,
                "detectDiscordKotlin": true,
                "showMillis": false
            },
            "MessageLinkEmbeds": {
                "enabled": true,
                "automodEmbeds": "never",
                "listMode": "blacklist",
                "idList": ""
            },
            "MessageLogger": {
                "enabled": true,
                "deleteStyle": "text",
                "ignoreBots": true,
                "ignoreSelf": true,
                "ignoreUsers": "",
                "ignoreChannels": "",
                "ignoreGuilds": "",
                "logEdits": true,
                "logDeletes": true
            },
            "MessageTags": {
                "enabled": true,
                "clyde": true
            },
            "MoreCommands": {
                "enabled": true
            },
            "MoreKaomoji": {
                "enabled": true
            },
            "MoreUserTags": {
                "enabled": true,
                "tagSettings": {
                    "WEBHOOK": {
                        "text": "Webhook",
                        "showInChat": false,
                        "showInNotChat": true
                    },
                    "OWNER": {
                        "text": "Owner",
                        "showInChat": true,
                        "showInNotChat": true
                    },
                    "ADMINISTRATOR": {
                        "text": "Admin",
                        "showInChat": true,
                        "showInNotChat": true
                    },
                    "MODERATOR_STAFF": {
                        "text": "Staff",
                        "showInChat": false,
                        "showInNotChat": true
                    },
                    "MODERATOR": {
                        "text": "Mod",
                        "showInChat": false,
                        "showInNotChat": true
                    },
                    "VOICE_MODERATOR": {
                        "text": "VC Mod",
                        "showInChat": false,
                        "showInNotChat": true
                    },
                    "CHAT_MODERATOR": {
                        "text": "Chat Mod",
                        "showInChat": false,
                        "showInNotChat": true
                    }
                },
                "dontShowForBots": true
            },
            "Moyai": {
                "enabled": false
            },
            "MutualGroupDMs": {
                "enabled": true
            },
            "NewGuildSettings": {
                "enabled": true
            },
            "NoBlockedMessages": {
                "enabled": false
            },
            "NoDefaultHangStatus": {
                "enabled": false
            },
            "NoDevtoolsWarning": {
                "enabled": false
            },
            "NoF1": {
                "enabled": true
            },
            "NoMosaic": {
                "enabled": false
            },
            "NoPendingCount": {
                "enabled": false
            },
            "NoProfileThemes": {
                "enabled": false
            },
            "NoReplyMention": {
                "enabled": false
            },
            "NoScreensharePreview": {
                "enabled": false
            },
            "NoServerEmojis": {
                "enabled": false
            },
            "NoTypingAnimation": {
                "enabled": false
            },
            "NoUnblockToJump": {
                "enabled": false
            },
            "NormalizeMessageLinks": {
                "enabled": false
            },
            "NotificationVolume": {
                "enabled": false
            },
            "NSFWGateBypass": {
                "enabled": false
            },
            "OnePingPerDM": {
                "enabled": false
            },
            "oneko": {
                "enabled": false
            },
            "OpenInApp": {
                "enabled": false
            },
            "OverrideForumDefaults": {
                "enabled": false,
                "defaultLayout": 1,
                "defaultSortOrder": 0
            },
            "PartyMode": {
                "enabled": false
            },
            "PauseInvitesForever": {
                "enabled": false
            },
            "PermissionFreeWill": {
                "enabled": false
            },
            "PermissionsViewer": {
                "enabled": true
            },
            "petpet": {
                "enabled": false
            },
            "PictureInPicture": {
                "enabled": false,
                "loop": true
            },
            "PinDMs": {
                "enabled": true,
                "dmSectioncollapsed": false
            },
            "PlainFolderIcon": {
                "enabled": false
            },
            "PlatformIndicators": {
                "enabled": false
            },
            "PreviewMessage": {
                "enabled": true
            },
            "PronounDB": {
                "enabled": false
            },
            "QuickMention": {
                "enabled": true
            },
            "QuickReply": {
                "enabled": true
            },
            "ReactErrorDecoder": {
                "enabled": false
            },
            "ReadAllNotificationsButton": {
                "enabled": true
            },
            "RelationshipNotifier": {
                "enabled": true,
                "offlineRemovals": true,
                "groups": true,
                "servers": true,
                "friends": true,
                "friendRequestCancels": true
            },
            "ReplaceGoogleSearch": {
                "enabled": false
            },
            "ReplyTimestamp": {
                "enabled": false
            },
            "ResurrectHome": {
                "enabled": false
            },
            "RevealAllSpoilers": {
                "enabled": false
            },
            "ReverseImageSearch": {
                "enabled": true
            },
            "ReviewDB": {
                "enabled": false,
                "notifyReviews": true,
                "showWarning": true,
                "hideTimestamps": false,
                "hideBlockedUsers": true
            },
            "RoleColorEverywhere": {
                "enabled": true,
                "chatMentions": true,
                "memberList": true,
                "voiceUsers": true
            },
            "SearchReply": {
                "enabled": true
            },
            "SecretRingToneEnabler": {
                "enabled": false
            },
            "SendTimestamps": {
                "enabled": true
            },
            "ServerListIndicators": {
                "enabled": false
            },
            "ServerProfile": {
                "enabled": true
            },
            "ShikiCodeblocks": {
                "enabled": false
            },
            "ShowAllMessageButtons": {
                "enabled": false
            },
            "ShowConnections": {
                "enabled": true
            },
            "ShowHiddenChannels": {
                "enabled": true,
                "showMode": 0,
                "hideUnreads": true
            },
            "ShowHiddenThings": {
                "enabled": false,
                "showTimeouts": true,
                "showInvitesPaused": true,
                "showModView": true,
                "disableDiscoveryFilters": true,
                "disableDisallowedDiscoveryFilters": true
            },
            "ShowMeYourName": {
                "enabled": false
            },
            "ShowTimeoutDuration": {
                "enabled": false
            },
            "SilentMessageToggle": {
                "enabled": false
            },
            "SilentTyping": {
                "enabled": true,
                "isEnabled": true,
                "showIcon": false
            },
            "SortFriendRequests": {
                "enabled": false
            },
            "SpotifyControls": {
                "enabled": false
            },
            "SpotifyCrack": {
                "enabled": false
            },
            "SpotifyShareCommands": {
                "enabled": false
            },
            "StartupTimings": {
                "enabled": true
            },
            "StreamerModeOnStream": {
                "enabled": true
            },
            "SuperReactionTweaks": {
                "enabled": false
            },
            "TextReplace": {
                "enabled": false
            },
            "ThemeAttributes": {
                "enabled": false
            },
            "TimeBarAllActivities": {
                "enabled": false
            },
            "Translate": {
                "enabled": false
            },
            "TypingIndicator": {
                "enabled": true,
                "includeMutedChannels": false,
                "includeCurrentChannel": true,
                "indicatorMode": 3
            },
            "TypingTweaks": {
                "enabled": false
            },
            "Unindent": {
                "enabled": false
            },
            "UnlockedAvatarZoom": {
                "enabled": false
            },
            "UnsuppressEmbeds": {
                "enabled": false
            },
            "UrbanDictionary": {
                "enabled": true
            },
            "UserVoiceShow": {
                "enabled": false
            },
            "USRBG": {
                "enabled": false
            },
            "ValidReply": {
                "enabled": false
            },
            "ValidUser": {
                "enabled": true
            },
            "VoiceChatDoubleClick": {
                "enabled": false
            },
            "VcNarrator": {
                "enabled": false
            },
            "VencordToolbox": {
                "enabled": false
            },
            "ViewIcons": {
                "enabled": true
            },
            "ViewRaw": {
                "enabled": true,
                "clickMethod": "Left"
            },
            "VoiceDownload": {
                "enabled": false
            },
            "VoiceMessages": {
                "enabled": false
            },
            "WebContextMenus": {
                "enabled": true,
                "addBack": true
            },
            "WebKeybinds": {
                "enabled": true
            },
            "WebScreenShareFixes": {
                "enabled": true
            },
            "WhoReacted": {
                "enabled": true
            },
            "Wikisearch": {
                "enabled": false
            },
            "XSOverlay": {
                "enabled": false
            }
        },
        "notifications": {
            "timeout": 5000,
            "position": "bottom-right",
            "useNative": "not-focused",
            "logLimit": 50
        },
        "cloud": {
            "authenticated": false,
            "url": "https://api.vencord.dev/",
            "settingsSync": false,
            "settingsSyncVersion": 1717333591961
        }
      }
    '';
  };
}
