{pkgs, overlays, ...} : {

    programs.firefox = {

        enable = true;

        profiles.fia = {

            settings = {
                "browser.download.panel.shown" = true;
                "browser.newtabpage.activity-stream.enabled" = true;
                "browser.newtabpage.activity-stream.default.sites" = "";
                "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
                "browser.newtabpage.activity-stream.feeds.topsites" = false;
                "browser.newtabpage.activity-stream.discoverystream.sendToPocket.enabled" = false;
                "extensions.autoDisableScopes" = 0;
                "browser.newtabpage.activity-stream.feeds.wallpaperfeed" = true;
                "browser.newtabpage.activity-stream.newtabWallpapers.customWallpaper.enabled" = true;
                "browser.newtabpage.activity-stream.newtabWallpapers.wallpaper" = "abstract-blue-purple";
            };

            extensions.packages = with pkgs.firefox-addons; [
                ublock-origin
                sponsorblock
                bitwarden
                violentmonkey
                consent-o-matic
                indie-wiki-buddy
                reddit-enhancement-suite
                betterttv
                beyond-20
            ];
        };
    };
}