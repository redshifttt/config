{ config, ... }:
{
  programs.newsboat = {
    enable = true;
    autoReload = true;
    browser = config.programs.zsh.sessionVariables.BROWSER;
    reloadThreads = 4; # good measure
    urls = [
      { url = "https://soda.privatevoid.net/num/blog/index.xml"; }
      { url = "https://lukesmith.xyz/index.xml"; }
      { url = "https://www.nasaspaceflight.com/feed/"; }
      { url = "https://www.nasaspaceflight.com/news/spacex/feed/"; }
    ];
    extraConfig = ''
      highlight article "(^Feed:.*|^Title:.*|^Author:.*|^Date:.*|^Link:.*)" default default bold
      highlight article "(^Feed:|^Title:|^Author:|^Date:|^Link:)" green default bold
      text-width 80
      bind-key j down
      bind-key k up
      bind-key j next articlelist
      bind-key k prev articlelist
      bind-key G end
      bind-key g home
      bind-key d pagedown
      bind-key u pageup
      bind-key l open
      bind-key h quit
      color listnormal cyan default
      color listfocus black yellow bold
      color listnormal_unread blue default bold
      color listfocus_unread black yellow bold
      color info red black bold
      color article white default
    '';
  };
}
