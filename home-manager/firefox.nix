{pkgs, config, overlays, ...} : {

    programs.firefox = {

        enable = true;
        configPath = "${config.xdg.configHome}/mozilla/firefox";

        profiles.fia = {

            settings = {
                "browser.download.panel.shown" = true;

                "browser.newtabpage.activity-stream.enabled" = true;
                "browser.newtabpage.activity-stream.default.sites" = "";
                "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
                "browser.newtabpage.activity-stream.feeds.topsites" = true;
                "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
                "browser.newtabpage.activity-stream.discoverystream.sendToPocket.enabled" = false;
                "browser.newtabpage.activity-stream.feeds.wallpaperfeed" = true;
                "browser.newtabpage.activity-stream.newtabWallpapers.customWallpaper.enabled" = true;
                "browser.newtabpage.activity-stream.newtabWallpapers.wallpaper" = "abstract-blue-purple";

                "browser.compactmode.show" = true;

                "extensions.autoDisableScopes" = 0;
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

            userContent = ''
                @-moz-document url("about:newtab"), url("about:home") {
                .top-site-outer .tile .icon-wrapper,
                .top-site-outer .default-icon {
                    width: 80px !important;
                    height: 80px !important;
                    background-size: cover !important;
                }

                .top-site-outer {
                    width: 90px !important;
                }
                }
            '';
        };
    };
}