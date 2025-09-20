{...}: {
  programs.vesktop = {
    enable = true;
    settings = {
      appBadge = false;
      arRPC = true;
      checkUpdates = false;
      customTitleBar = false;
      disableMinSize = true;
      minimizeToTray = false;
      tray = false;
      staticTitle = true;
      hardwareVideoAcceleration = true;
      hardwareAcceleration = true;
      discordBranch = "stable";
      enableSplashScreen = false;
    };
    vencord = {
      settings = {
        autoUpdate = false;
        autoUpdateNotification = false;
        notifyAboutUpdates = false;
        useQuickCss = true;
        disableMinSize = true;
        plugins = {
          AccountPanelServerProfile = {
            enabled = true;
            prioritizeServerProfile = false;
          };
          AnonymiseFileNames = {
            enabled = true;
            anonymiseByDefault = true;
            method = 0;
            randomisedLength = 7;
            consistent = "image";
          };
          BetterSettings = {
            enabled = true;
            disableFade = true;
            organizeMenu = true;
            eagerLoad = true;
          };
          BiggerStreamPreview = {
            enabled = true;
          };
          CallTimer = {
            enabled = true;
          };
          ClearURLs = {
            enabled = true;
          };
          CopyEmojiMarkdown = {
            enabled = true;
            copyUnicode = true;
          };
          CopyUserURLs = {
            enabled = true;
          };
          CrashHandler = {
            enabled = true;
          };
          FavoriteEmojiFirst = {
            enabled = true;
          };
          FavoriteGifSearch = {
            enabled = true;
            searchOption = "hostandpath";
          };
          ImageZoom = {
            enabled = true;
            saveZoomValues = true;
            invertScroll = true;
            nearestNeighbour = false;
            square = false;
            zoom = 2;
            size = 100;
            zoomSpeed = 0.5;
          };
          ImplicitRelationships = {
            enabled = true;
          };
          MemberCount = {
            enabled = true;
            toolTip = true;
            memberList = true;
            voiceActivity = true;
          };
          MessageLogger = {
            enabled = true;
            deleteStyle = "text";
            logDeletes = true;
            collapseDeleted = false;
            logEdits = true;
            inlineEdits = true;
            ignoreBots = true;
            ignoreSelf = true;
            ignoreUsers = "";
            ignoreChannels = "";
            ignoreGuilds = "";
          };
          NewGuildSettings = {
            enabled = true;
            guild = true;
            messages = 1;
            everyone = true;
            role = true;
            highlights = true;
            events = true;
            showAllChannels = true;
          };
          NoTypingAnimation = {
            enabled = true;
          };
          PermissionsViewer = {
            enabled = true;
          };
          PreviewMessage = {
            enabled = true;
          };
          QuickMention = {
            enabled = true;
          };
          ReadAllNotificationsButton = {
            enabled = true;
          };
          RelationshipNotifier = {
            enabled = true;
          };
          RoleColorEverywhere = {
            enabled = true;
          };
          SendTimestamps = {
            enabled = true;
            replaceMessageContents = true;
          };
          ServerInfo = {
            enabled = true;
          };
          ShowHiddenChannels = {
            enabled = true;
            hideUnreads = true;
            showMode = 0;
            defaultAllowedUsersAndRolesDropdownState = true;
          };
          SilentTyping = {
            enabled = true;
            isEnabled = true;
            showIcon = false;
            contextMenu = true;
          };
          ViewIcons = {
            enabled = true;
          };
          ViewRaw = {
            enabled = true;
            clickMethod = "Left";
          };
          VolumeBooster = {
            enabled = true;
          };
          WebKeybinds = {
            enabled = true;
          };
          WebScreenShareFixes = {
            enabled = true;
          };
          BadgeAPI = {
            enabled = true;
          };
        };
      };
      themes = {};
    };
  };
}

