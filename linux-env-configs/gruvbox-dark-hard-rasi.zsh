/* ==========================================================================
   Rofi color theme

   Based on the Gruvbox color scheme for Vim by morhetz
   https://github.com/morhetz/gruvbox

   File: gruvbox-dark-hard.rasi
   Desc: Gruvbox dark (hard contrast) color theme for Rofi
   Author: bardisty <b@bah.im>
   Source: https://github.com/bardisty/gruvbox-rofi
   Modified: Mon Feb 12 2018 06:04:26 PST -0800
   ========================================================================== */

* {
    /* Theme settings */
    highlight: bold italic;
    scrollbar: true;

    /* Gruvbox dark colors */
    gruvbox-dark-bg0-hard:     #1D1D1D;
    gruvbox-dark-bg0:          #282828;
    gruvbox-dark-bg2:          #504945;
    gruvbox-dark-fg0:          #fbf1c7;
    gruvbox-dark-fg1:          #ebdbb2;
    gruvbox-dark-red-dark:     #cc241d;
    gruvbox-dark-red-light:    #fb4934;
    gruvbox-dark-yellow-dark:  #FFFFFF;
    gruvbox-dark-yellow-light: #DBDBDB;
    gruvbox-dark-gray:         #a89984;

    /* Theme colors */
    background:                  #4E4E4E;
    background-color:            #363636;
    foreground:                  @gruvbox-dark-fg1;
    border-color:                #070707;
    separatorcolor:              #000000;
    scrollbar-handle:            @border-color;

    normal-background:           @background;
    normal-foreground:           @foreground;
    alternate-normal-background: @gruvbox-dark-bg0;
    alternate-normal-foreground: @foreground;
    selected-normal-background:  #070707;
    selected-normal-foreground:  @gruvbox-dark-fg0;

    active-background:           @gruvbox-dark-yellow-dark;
    active-foreground:           @background;
    alternate-active-background: @active-background;
    alternate-active-foreground: @active-foreground;
    selected-active-background:  @gruvbox-dark-yellow-light;
    selected-active-foreground:  @active-foreground;

    urgent-background:           @gruvbox-dark-red-dark;
    urgent-foreground:           @background;
    alternate-urgent-background: @urgent-background;
    alternate-urgent-foreground: @urgent-foreground;
    selected-urgent-background:  @gruvbox-dark-red-light;
    selected-urgent-foreground:  @urgent-foreground;
}

@import "gruvbox-common.rasi"

