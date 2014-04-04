//
//  SyncData.m
//  ssg-ios
//
//  Created by Haris Dautovic on 29/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "SyncData.h"
#import "AppDelegate.h"
#import "City.h"

@implementation SyncData


static SyncData *__mainData;

- (id) init {
    self = [super init];
    if (self != nil) {
        
       self.keyCharForFontAwesome=[[NSMutableDictionary alloc]init];
        [self.keyCharForFontAwesome setValue:@"0xf000" forKey:@"fa-glass"];
        [self.keyCharForFontAwesome setValue:@"0xf001" forKey:@"fa-music"];
        [self.keyCharForFontAwesome setValue:@"0xf002" forKey:@"fa-search"];
        [self.keyCharForFontAwesome setValue:@"0xf003" forKey:@"fa-envelope-o"];
        [self.keyCharForFontAwesome setValue:@"0xf004" forKey:@"fa-heart"];
        [self.keyCharForFontAwesome setValue:@"0xf005" forKey:@"fa-star"];
        [self.keyCharForFontAwesome setValue:@"0xf006" forKey:@"fa-star-o"];
        [self.keyCharForFontAwesome setValue:@"0xf007" forKey:@"fa-user"];
        [self.keyCharForFontAwesome setValue:@"0xf008" forKey:@"fa-film"];
        [self.keyCharForFontAwesome setValue:@"0xf009" forKey:@"fa-th-large"];
        [self.keyCharForFontAwesome setValue:@"0xf00a" forKey:@"fa-th"];
        [self.keyCharForFontAwesome setValue:@"0xf00b" forKey:@"fa-th-list"];
        [self.keyCharForFontAwesome setValue:@"0xf00c" forKey:@"fa-check"];
        [self.keyCharForFontAwesome setValue:@"0xf00d" forKey:@"fa-times"];
        [self.keyCharForFontAwesome setValue:@"0xf00e" forKey:@"fa-search-plus"];
        [self.keyCharForFontAwesome setValue:@"0xf010" forKey:@"fa-search-minus"];
        [self.keyCharForFontAwesome setValue:@"0xf011" forKey:@"fa-power-off"];
        [self.keyCharForFontAwesome setValue:@"0xf012" forKey:@"fa-signal"];
        [self.keyCharForFontAwesome setValue:@"0xf013" forKey:@"fa-cog"];
        [self.keyCharForFontAwesome setValue:@"0xf014" forKey:@"fa-trash-o"];
        [self.keyCharForFontAwesome setValue:@"0xf015" forKey:@"fa-home"];
        [self.keyCharForFontAwesome setValue:@"0xf016" forKey:@"fa-file-o"];
        [self.keyCharForFontAwesome setValue:@"0xf017" forKey:@"fa-clock-o"];
        [self.keyCharForFontAwesome setValue:@"0xf018" forKey:@"fa-road"];
        [self.keyCharForFontAwesome setValue:@"0xf019" forKey:@"fa-download"];
        [self.keyCharForFontAwesome setValue:@"0xf01a" forKey:@"fa-arrow-circle-o-down"];
        [self.keyCharForFontAwesome setValue:@"0xf01b" forKey:@"fa-arrow-circle-o-up"];
        [self.keyCharForFontAwesome setValue:@"0xf01c" forKey:@"fa-inbox"];
        [self.keyCharForFontAwesome setValue:@"0xf01d" forKey:@"fa-play-circle-o"];
        [self.keyCharForFontAwesome setValue:@"0xf01e" forKey:@"fa-repeat"];
        [self.keyCharForFontAwesome setValue:@"0xf021" forKey:@"fa-refresh"];
        [self.keyCharForFontAwesome setValue:@"0xf022" forKey:@"fa-list-alt"];
        [self.keyCharForFontAwesome setValue:@"0xf023" forKey:@"fa-lock"];
        [self.keyCharForFontAwesome setValue:@"0xf024" forKey:@"fa-flag"];
        [self.keyCharForFontAwesome setValue:@"0xf025" forKey:@"fa-headphones"];
        [self.keyCharForFontAwesome setValue:@"0xf026" forKey:@"fa-volume-off"];
        [self.keyCharForFontAwesome setValue:@"0xf027" forKey:@"fa-volume-down"];
        [self.keyCharForFontAwesome setValue:@"0xf028" forKey:@"fa-volume-up"];
        [self.keyCharForFontAwesome setValue:@"0xf029" forKey:@"fa-qrcode"];
        [self.keyCharForFontAwesome setValue:@"0xf02a" forKey:@"fa-barcode"];
        [self.keyCharForFontAwesome setValue:@"0xf02b" forKey:@"fa-tag"];
        [self.keyCharForFontAwesome setValue:@"0xf02c" forKey:@"fa-tags"];
        [self.keyCharForFontAwesome setValue:@"0xf02d" forKey:@"fa-book"];
        [self.keyCharForFontAwesome setValue:@"0xf02e" forKey:@"fa-bookmark"];
        [self.keyCharForFontAwesome setValue:@"0xf02f" forKey:@"fa-print"];
        [self.keyCharForFontAwesome setValue:@"0xf030" forKey:@"fa-camera"];
        [self.keyCharForFontAwesome setValue:@"0xf031" forKey:@"fa-font"];
        [self.keyCharForFontAwesome setValue:@"0xf032" forKey:@"fa-bold"];
        [self.keyCharForFontAwesome setValue:@"0xf033" forKey:@"fa-italic"];
        [self.keyCharForFontAwesome setValue:@"0xf034" forKey:@"fa-text-height"];
        [self.keyCharForFontAwesome setValue:@"0xf035" forKey:@"fa-text-width"];
        [self.keyCharForFontAwesome setValue:@"0xf036" forKey:@"fa-align-left"];
        [self.keyCharForFontAwesome setValue:@"0xf037" forKey:@"fa-align-center"];
        [self.keyCharForFontAwesome setValue:@"0xf038" forKey:@"fa-align-right"];
        [self.keyCharForFontAwesome setValue:@"0xf039" forKey:@"fa-align-justify"];
        [self.keyCharForFontAwesome setValue:@"0xf03a" forKey:@"fa-list"];
        [self.keyCharForFontAwesome setValue:@"0xf03b" forKey:@"fa-outdent"];
        [self.keyCharForFontAwesome setValue:@"0xf03c" forKey:@"fa-indent"];
        [self.keyCharForFontAwesome setValue:@"0xf03d" forKey:@"fa-video-camera"];
        [self.keyCharForFontAwesome setValue:@"0xf03e" forKey:@"fa-picture-o"];
        [self.keyCharForFontAwesome setValue:@"0xf040" forKey:@"fa-pencil"];
        [self.keyCharForFontAwesome setValue:@"0xf041" forKey:@"fa-self.keyCharForFontAwesome-marker"];
        [self.keyCharForFontAwesome setValue:@"0xf042" forKey:@"fa-adjust"];
        [self.keyCharForFontAwesome setValue:@"0xf043" forKey:@"fa-tint"];
        [self.keyCharForFontAwesome setValue:@"0xf044" forKey:@"fa-pencil-square-o"];
        [self.keyCharForFontAwesome setValue:@"0xf045" forKey:@"fa-share-square-o"];
        [self.keyCharForFontAwesome setValue:@"0xf046" forKey:@"fa-check-square-o"];
        [self.keyCharForFontAwesome setValue:@"0xf047" forKey:@"fa-arrows"];
        [self.keyCharForFontAwesome setValue:@"0xf048" forKey:@"fa-step-backward"];
        [self.keyCharForFontAwesome setValue:@"0xf049" forKey:@"fa-fast-backward"];
        [self.keyCharForFontAwesome setValue:@"0xf04a" forKey:@"fa-backward"];
        [self.keyCharForFontAwesome setValue:@"0xf04b" forKey:@"fa-play"];
        [self.keyCharForFontAwesome setValue:@"0xf04c" forKey:@"fa-pause"];
        [self.keyCharForFontAwesome setValue:@"0xf04d" forKey:@"fa-stop"];
        [self.keyCharForFontAwesome setValue:@"0xf04e" forKey:@"fa-forward"];
        [self.keyCharForFontAwesome setValue:@"0xf050" forKey:@"fa-fast-forward"];
        [self.keyCharForFontAwesome setValue:@"0xf051" forKey:@"fa-step-forward"];
        [self.keyCharForFontAwesome setValue:@"0xf052" forKey:@"fa-eject"];
        [self.keyCharForFontAwesome setValue:@"0xf053" forKey:@"fa-chevron-left"];
        [self.keyCharForFontAwesome setValue:@"0xf054" forKey:@"fa-chevron-right"];
        [self.keyCharForFontAwesome setValue:@"0xf055" forKey:@"fa-plus-circle"];
        [self.keyCharForFontAwesome setValue:@"0xf056" forKey:@"fa-minus-circle"];
        [self.keyCharForFontAwesome setValue:@"0xf057" forKey:@"fa-times-circle"];
        [self.keyCharForFontAwesome setValue:@"0xf058" forKey:@"fa-check-circle"];
        [self.keyCharForFontAwesome setValue:@"0xf059" forKey:@"fa-question-circle"];
        [self.keyCharForFontAwesome setValue:@"0xf05a" forKey:@"fa-info-circle"];
        [self.keyCharForFontAwesome setValue:@"0xf05b" forKey:@"fa-crosshairs"];
        [self.keyCharForFontAwesome setValue:@"0xf05c" forKey:@"fa-times-circle-o"];
        [self.keyCharForFontAwesome setValue:@"0xf05d" forKey:@"fa-check-circle-o"];
        [self.keyCharForFontAwesome setValue:@"0xf05e" forKey:@"fa-ban"];
        [self.keyCharForFontAwesome setValue:@"0xf060" forKey:@"fa-arrow-left"];
        [self.keyCharForFontAwesome setValue:@"0xf061" forKey:@"fa-arrow-right"];
        [self.keyCharForFontAwesome setValue:@"0xf062" forKey:@"fa-arrow-up"];
        [self.keyCharForFontAwesome setValue:@"0xf063" forKey:@"fa-arrow-down"];
        [self.keyCharForFontAwesome setValue:@"0xf064" forKey:@"fa-share"];
        [self.keyCharForFontAwesome setValue:@"0xf065" forKey:@"fa-expand"];
        [self.keyCharForFontAwesome setValue:@"0xf066" forKey:@"fa-compress"];
        [self.keyCharForFontAwesome setValue:@"0xf067" forKey:@"fa-plus"];
        [self.keyCharForFontAwesome setValue:@"0xf068" forKey:@"fa-minus"];
        [self.keyCharForFontAwesome setValue:@"0xf069" forKey:@"fa-asterisk"];
        [self.keyCharForFontAwesome setValue:@"0xf06a" forKey:@"fa-exclamation-circle"];
        [self.keyCharForFontAwesome setValue:@"0xf06b" forKey:@"fa-gift"];
        [self.keyCharForFontAwesome setValue:@"0xf06c" forKey:@"fa-leaf"];
        [self.keyCharForFontAwesome setValue:@"0xf06d" forKey:@"fa-fire"];
        [self.keyCharForFontAwesome setValue:@"0xf06e" forKey:@"fa-eye"];
        [self.keyCharForFontAwesome setValue:@"0xf070" forKey:@"fa-eye-slash"];
        [self.keyCharForFontAwesome setValue:@"0xf071" forKey:@"fa-exclamation-triangle"];
        [self.keyCharForFontAwesome setValue:@"0xf072" forKey:@"fa-plane"];
        [self.keyCharForFontAwesome setValue:@"0xf073" forKey:@"fa-calendar"];
        [self.keyCharForFontAwesome setValue:@"0xf074" forKey:@"fa-random"];
        [self.keyCharForFontAwesome setValue:@"0xf075" forKey:@"fa-comment"];
        [self.keyCharForFontAwesome setValue:@"0xf076" forKey:@"fa-magnet"];
        [self.keyCharForFontAwesome setValue:@"0xf077" forKey:@"fa-chevron-up"];
        [self.keyCharForFontAwesome setValue:@"0xf078" forKey:@"fa-chevron-down"];
        [self.keyCharForFontAwesome setValue:@"0xf079" forKey:@"fa-retweet"];
        [self.keyCharForFontAwesome setValue:@"0xf07a" forKey:@"fa-shopping-cart"];
        [self.keyCharForFontAwesome setValue:@"0xf07b" forKey:@"fa-folder"];
        [self.keyCharForFontAwesome setValue:@"0xf07c" forKey:@"fa-folder-open"];
        [self.keyCharForFontAwesome setValue:@"0xf07d" forKey:@"fa-arrows-v"];
        [self.keyCharForFontAwesome setValue:@"0xf07e" forKey:@"fa-arrows-h"];
        [self.keyCharForFontAwesome setValue:@"0xf080" forKey:@"fa-bar-chart-o"];
        [self.keyCharForFontAwesome setValue:@"0xf081" forKey:@"fa-twitter-square"];
        [self.keyCharForFontAwesome setValue:@"0xf082" forKey:@"fa-facebook-square"];
        [self.keyCharForFontAwesome setValue:@"0xf083" forKey:@"fa-camera-retro"];
        [self.keyCharForFontAwesome setValue:@"0xf084" forKey:@"fa-key"];
        [self.keyCharForFontAwesome setValue:@"0xf085" forKey:@"fa-cogs"];
        [self.keyCharForFontAwesome setValue:@"0xf086" forKey:@"fa-comments"];
        [self.keyCharForFontAwesome setValue:@"0xf087" forKey:@"fa-thumbs-o-up"];
        [self.keyCharForFontAwesome setValue:@"0xf088" forKey:@"fa-thumbs-o-down"];
        [self.keyCharForFontAwesome setValue:@"0xf089" forKey:@"fa-star-half"];
        [self.keyCharForFontAwesome setValue:@"0xf08a" forKey:@"fa-heart-o"];
        [self.keyCharForFontAwesome setValue:@"0xf08b" forKey:@"fa-sign-out"];
        [self.keyCharForFontAwesome setValue:@"0xf08c" forKey:@"fa-linkedin-square"];
        [self.keyCharForFontAwesome setValue:@"0xf08d" forKey:@"fa-thumb-tack"];
        [self.keyCharForFontAwesome setValue:@"0xf08e" forKey:@"fa-external-link"];
        [self.keyCharForFontAwesome setValue:@"0xf090" forKey:@"fa-sign-in"];
        [self.keyCharForFontAwesome setValue:@"0xf091" forKey:@"fa-trophy"];
        [self.keyCharForFontAwesome setValue:@"0xf092" forKey:@"fa-github-square"];
        [self.keyCharForFontAwesome setValue:@"0xf093" forKey:@"fa-upload"];
        [self.keyCharForFontAwesome setValue:@"0xf094" forKey:@"fa-lemon-o"];
        [self.keyCharForFontAwesome setValue:@"0xf095" forKey:@"fa-phone"];
        [self.keyCharForFontAwesome setValue:@"0xf096" forKey:@"fa-square-o"];
        [self.keyCharForFontAwesome setValue:@"0xf097" forKey:@"fa-bookmark-o"];
        [self.keyCharForFontAwesome setValue:@"0xf098" forKey:@"fa-phone-square"];
        [self.keyCharForFontAwesome setValue:@"0xf099" forKey:@"fa-twitter"];
        [self.keyCharForFontAwesome setValue:@"0xf09a" forKey:@"fa-facebook"];
        [self.keyCharForFontAwesome setValue:@"0xf09b" forKey:@"fa-github"];
        [self.keyCharForFontAwesome setValue:@"0xf09c" forKey:@"fa-unlock"];
        [self.keyCharForFontAwesome setValue:@"0xf09d" forKey:@"fa-credit-card"];
        [self.keyCharForFontAwesome setValue:@"0xf09e" forKey:@"fa-rss"];
        [self.keyCharForFontAwesome setValue:@"0xf0a0" forKey:@"fa-hdd-o"];
        [self.keyCharForFontAwesome setValue:@"0xf0a1" forKey:@"fa-bullhorn"];
        [self.keyCharForFontAwesome setValue:@"0xf0f3" forKey:@"fa-bell"];
        [self.keyCharForFontAwesome setValue:@"0xf0a3" forKey:@"fa-certificate"];
        [self.keyCharForFontAwesome setValue:@"0xf0a4" forKey:@"fa-hand-o-right"];
        [self.keyCharForFontAwesome setValue:@"0xf0a5" forKey:@"fa-hand-o-left"];
        [self.keyCharForFontAwesome setValue:@"0xf0a6" forKey:@"fa-hand-o-up"];
        [self.keyCharForFontAwesome setValue:@"0xf0a7" forKey:@"fa-hand-o-down"];
        [self.keyCharForFontAwesome setValue:@"0xf0a8" forKey:@"fa-arrow-circle-left"];
        [self.keyCharForFontAwesome setValue:@"0xf0a9" forKey:@"fa-arrow-circle-right"];
        [self.keyCharForFontAwesome setValue:@"0xf0aa" forKey:@"fa-arrow-circle-up"];
        [self.keyCharForFontAwesome setValue:@"0xf0ab" forKey:@"fa-arrow-circle-down"];
        [self.keyCharForFontAwesome setValue:@"0xf0ac" forKey:@"fa-globe"];
        [self.keyCharForFontAwesome setValue:@"0xf0ad" forKey:@"fa-wrench"];
        [self.keyCharForFontAwesome setValue:@"0xf0ae" forKey:@"fa-tasks"];
        [self.keyCharForFontAwesome setValue:@"0xf0b0" forKey:@"fa-filter"];
        [self.keyCharForFontAwesome setValue:@"0xf0b1" forKey:@"fa-briefcase"];
        [self.keyCharForFontAwesome setValue:@"0xf0b2" forKey:@"fa-arrows-alt"];
        [self.keyCharForFontAwesome setValue:@"0xf0c0" forKey:@"fa-users"];
        [self.keyCharForFontAwesome setValue:@"0xf0c1" forKey:@"fa-link"];
        [self.keyCharForFontAwesome setValue:@"0xf0c2" forKey:@"fa-cloud"];
        [self.keyCharForFontAwesome setValue:@"0xf0c3" forKey:@"fa-flask"];
        [self.keyCharForFontAwesome setValue:@"0xf0c4" forKey:@"fa-scissors"];
        [self.keyCharForFontAwesome setValue:@"0xf0c5" forKey:@"fa-files-o"];
        [self.keyCharForFontAwesome setValue:@"0xf0c6" forKey:@"fa-paperclip"];
        [self.keyCharForFontAwesome setValue:@"0xf0c7" forKey:@"fa-floppy-o"];
        [self.keyCharForFontAwesome setValue:@"0xf0c8" forKey:@"fa-square"];
        [self.keyCharForFontAwesome setValue:@"0xf0c9" forKey:@"fa-bars"];
        [self.keyCharForFontAwesome setValue:@"0xf0ca" forKey:@"fa-list-ul"];
        [self.keyCharForFontAwesome setValue:@"0xf0cb" forKey:@"fa-list-ol"];
        [self.keyCharForFontAwesome setValue:@"0xf0cc" forKey:@"fa-strikethrough"];
        [self.keyCharForFontAwesome setValue:@"0xf0cd" forKey:@"fa-underline"];
        [self.keyCharForFontAwesome setValue:@"0xf0ce" forKey:@"fa-table"];
        [self.keyCharForFontAwesome setValue:@"0xf0d0" forKey:@"fa-magic"];
        [self.keyCharForFontAwesome setValue:@"0xf0d1" forKey:@"fa-truck"];
        [self.keyCharForFontAwesome setValue:@"0xf0d2" forKey:@"fa-pinterest"];
        [self.keyCharForFontAwesome setValue:@"0xf0d3" forKey:@"fa-pinterest-square"];
        [self.keyCharForFontAwesome setValue:@"0xf0d4" forKey:@"fa-google-plus-square"];
        [self.keyCharForFontAwesome setValue:@"0xf0d5" forKey:@"fa-google-plus"];
        [self.keyCharForFontAwesome setValue:@"0xf0d6" forKey:@"fa-money"];
        [self.keyCharForFontAwesome setValue:@"0xf0d7" forKey:@"fa-caret-down"];
        [self.keyCharForFontAwesome setValue:@"0xf0d8" forKey:@"fa-caret-up"];
        [self.keyCharForFontAwesome setValue:@"0xf0d9" forKey:@"fa-caret-left"];
        [self.keyCharForFontAwesome setValue:@"0xf0da" forKey:@"fa-caret-right"];
        [self.keyCharForFontAwesome setValue:@"0xf0db" forKey:@"fa-columns"];
        [self.keyCharForFontAwesome setValue:@"0xf0dc" forKey:@"fa-sort"];
        [self.keyCharForFontAwesome setValue:@"0xf0dd" forKey:@"fa-sort-asc"];
        [self.keyCharForFontAwesome setValue:@"0xf0de" forKey:@"fa-sort-desc"];
        [self.keyCharForFontAwesome setValue:@"0xf0e0" forKey:@"fa-envelope"];
        [self.keyCharForFontAwesome setValue:@"0xf0e1" forKey:@"fa-linkedin"];
        [self.keyCharForFontAwesome setValue:@"0xf0e2" forKey:@"fa-undo"];
        [self.keyCharForFontAwesome setValue:@"0xf0e3" forKey:@"fa-gavel"];
        [self.keyCharForFontAwesome setValue:@"0xf0e4" forKey:@"fa-tachometer"];
        [self.keyCharForFontAwesome setValue:@"0xf0e5" forKey:@"fa-comment-o"];
        [self.keyCharForFontAwesome setValue:@"0xf0e6" forKey:@"fa-comments-o"];
        [self.keyCharForFontAwesome setValue:@"0xf0e7" forKey:@"fa-bolt"];
        [self.keyCharForFontAwesome setValue:@"0xf0e8" forKey:@"fa-siteself.keyCharForFontAwesome"];
        [self.keyCharForFontAwesome setValue:@"0xf0e9" forKey:@"fa-umbrella"];
        [self.keyCharForFontAwesome setValue:@"0xf0ea" forKey:@"fa-clipboard"];
        [self.keyCharForFontAwesome setValue:@"0xf0eb" forKey:@"fa-lightbulb-o"];
        [self.keyCharForFontAwesome setValue:@"0xf0ec" forKey:@"fa-exchange"];
        [self.keyCharForFontAwesome setValue:@"0xf0ed" forKey:@"fa-cloud-download"];
        [self.keyCharForFontAwesome setValue:@"0xf0ee" forKey:@"fa-cloud-upload"];
        [self.keyCharForFontAwesome setValue:@"0xf0f0" forKey:@"fa-user-md"];
        [self.keyCharForFontAwesome setValue:@"0xf0f1" forKey:@"fa-stethoscope"];
        [self.keyCharForFontAwesome setValue:@"0xf0f2" forKey:@"fa-suitcase"];
        [self.keyCharForFontAwesome setValue:@"0xf0a2" forKey:@"fa-bell-o"];
        [self.keyCharForFontAwesome setValue:@"0xf0f4" forKey:@"fa-coffee"];
        [self.keyCharForFontAwesome setValue:@"0xf0f5" forKey:@"fa-cutlery"];
        [self.keyCharForFontAwesome setValue:@"0xf0f6" forKey:@"fa-file-text-o"];
        [self.keyCharForFontAwesome setValue:@"0xf0f7" forKey:@"fa-building-o"];
        [self.keyCharForFontAwesome setValue:@"0xf0f8" forKey:@"fa-hospital-o"];
        [self.keyCharForFontAwesome setValue:@"0xf0f9" forKey:@"fa-ambulance"];
        [self.keyCharForFontAwesome setValue:@"0xf0fa" forKey:@"fa-medkit"];
        [self.keyCharForFontAwesome setValue:@"0xf0fb" forKey:@"fa-fighter-jet"];
        [self.keyCharForFontAwesome setValue:@"0xf0fc" forKey:@"fa-beer"];
        [self.keyCharForFontAwesome setValue:@"0xf0fd" forKey:@"fa-h-square"];
        [self.keyCharForFontAwesome setValue:@"0xf0fe" forKey:@"fa-plus-square"];
        [self.keyCharForFontAwesome setValue:@"0xf100" forKey:@"fa-angle-double-left"];
        [self.keyCharForFontAwesome setValue:@"0xf101" forKey:@"fa-angle-double-right"];
        [self.keyCharForFontAwesome setValue:@"0xf102" forKey:@"fa-angle-double-up"];
        [self.keyCharForFontAwesome setValue:@"0xf103" forKey:@"fa-angle-double-down"];
        [self.keyCharForFontAwesome setValue:@"0xf104" forKey:@"fa-angle-left"];
        [self.keyCharForFontAwesome setValue:@"0xf105" forKey:@"fa-angle-right"];
        [self.keyCharForFontAwesome setValue:@"0xf106" forKey:@"fa-angle-up"];
        [self.keyCharForFontAwesome setValue:@"0xf107" forKey:@"fa-angle-down"];
        [self.keyCharForFontAwesome setValue:@"0xf108" forKey:@"fa-desktop"];
        [self.keyCharForFontAwesome setValue:@"0xf109" forKey:@"fa-laptop"];
        [self.keyCharForFontAwesome setValue:@"0xf10a" forKey:@"fa-tablet"];
        [self.keyCharForFontAwesome setValue:@"0xf10b" forKey:@"fa-mobile"];
        [self.keyCharForFontAwesome setValue:@"0xf10c" forKey:@"fa-circle-o"];
        [self.keyCharForFontAwesome setValue:@"0xf10d" forKey:@"fa-quote-left"];
        [self.keyCharForFontAwesome setValue:@"0xf10e" forKey:@"fa-quote-right"];
        [self.keyCharForFontAwesome setValue:@"0xf110" forKey:@"fa-spinner"];
        [self.keyCharForFontAwesome setValue:@"0xf111" forKey:@"fa-circle"];
        [self.keyCharForFontAwesome setValue:@"0xf112" forKey:@"fa-reply"];
        [self.keyCharForFontAwesome setValue:@"0xf113" forKey:@"fa-github-alt"];
        [self.keyCharForFontAwesome setValue:@"0xf114" forKey:@"fa-folder-o"];
        [self.keyCharForFontAwesome setValue:@"0xf115" forKey:@"fa-folder-open-o"];
        [self.keyCharForFontAwesome setValue:@"0xf118" forKey:@"fa-smile-o"];
        [self.keyCharForFontAwesome setValue:@"0xf119" forKey:@"fa-frown-o"];
        [self.keyCharForFontAwesome setValue:@"0xf11a" forKey:@"fa-meh-o"];
        [self.keyCharForFontAwesome setValue:@"0xf11b" forKey:@"fa-gamepad"];
        [self.keyCharForFontAwesome setValue:@"0xf11c" forKey:@"fa-keyboard-o"];
        [self.keyCharForFontAwesome setValue:@"0xf11d" forKey:@"fa-flag-o"];
        [self.keyCharForFontAwesome setValue:@"0xf11e" forKey:@"fa-flag-checkered"];
        [self.keyCharForFontAwesome setValue:@"0xf120" forKey:@"fa-terminal"];
        [self.keyCharForFontAwesome setValue:@"0xf121" forKey:@"fa-code"];
        [self.keyCharForFontAwesome setValue:@"0xf122" forKey:@"fa-reply-all"];
        [self.keyCharForFontAwesome setValue:@"0xf122" forKey:@"fa-mail-reply-all"];
        [self.keyCharForFontAwesome setValue:@"0xf123" forKey:@"fa-star-half-o"];
        [self.keyCharForFontAwesome setValue:@"0xf124" forKey:@"fa-location-arrow"];
        [self.keyCharForFontAwesome setValue:@"0xf125" forKey:@"fa-crop"];
        [self.keyCharForFontAwesome setValue:@"0xf126" forKey:@"fa-code-fork"];
        [self.keyCharForFontAwesome setValue:@"0xf127" forKey:@"fa-chain-broken"];
        [self.keyCharForFontAwesome setValue:@"0xf128" forKey:@"fa-question"];
        [self.keyCharForFontAwesome setValue:@"0xf129" forKey:@"fa-info"];
        [self.keyCharForFontAwesome setValue:@"0xf12a" forKey:@"fa-exclamation"];
        [self.keyCharForFontAwesome setValue:@"0xf12b" forKey:@"fa-superscript"];
        [self.keyCharForFontAwesome setValue:@"0xf12c" forKey:@"fa-subscript"];
        [self.keyCharForFontAwesome setValue:@"0xf12d" forKey:@"fa-eraser"];
        [self.keyCharForFontAwesome setValue:@"0xf12e" forKey:@"fa-puzzle-piece"];
        [self.keyCharForFontAwesome setValue:@"0xf130" forKey:@"fa-microphone"];
        [self.keyCharForFontAwesome setValue:@"0xf131" forKey:@"fa-microphone-slash"];
        [self.keyCharForFontAwesome setValue:@"0xf132" forKey:@"fa-shield"];
        [self.keyCharForFontAwesome setValue:@"0xf133" forKey:@"fa-calendar-o"];
        [self.keyCharForFontAwesome setValue:@"0xf134" forKey:@"fa-fire-extinguisher"];
        [self.keyCharForFontAwesome setValue:@"0xf135" forKey:@"fa-rocket"];
        [self.keyCharForFontAwesome setValue:@"0xf136" forKey:@"fa-maxcdn"];
        [self.keyCharForFontAwesome setValue:@"0xf137" forKey:@"fa-chevron-circle-left"];
        [self.keyCharForFontAwesome setValue:@"0xf138" forKey:@"fa-chevron-circle-right"];
        [self.keyCharForFontAwesome setValue:@"0xf139" forKey:@"fa-chevron-circle-up"];
        [self.keyCharForFontAwesome setValue:@"0xf13a" forKey:@"fa-chevron-circle-down"];
        [self.keyCharForFontAwesome setValue:@"0xf13b" forKey:@"fa-html5"];
        [self.keyCharForFontAwesome setValue:@"0xf13c" forKey:@"fa-css3"];
        [self.keyCharForFontAwesome setValue:@"0xf13d" forKey:@"fa-anchor"];
        [self.keyCharForFontAwesome setValue:@"0xf13e" forKey:@"fa-unlock-alt"];
        [self.keyCharForFontAwesome setValue:@"0xf140" forKey:@"fa-bullseye"];
        [self.keyCharForFontAwesome setValue:@"0xf141" forKey:@"fa-ellipsis-h"];
        [self.keyCharForFontAwesome setValue:@"0xf142" forKey:@"fa-ellipsis-v"];
        [self.keyCharForFontAwesome setValue:@"0xf143" forKey:@"fa-rss-square"];
        [self.keyCharForFontAwesome setValue:@"0xf144" forKey:@"fa-play-circle"];
        [self.keyCharForFontAwesome setValue:@"0xf145" forKey:@"fa-ticket"];
        [self.keyCharForFontAwesome setValue:@"0xf146" forKey:@"fa-minus-square"];
        [self.keyCharForFontAwesome setValue:@"0xf147" forKey:@"fa-minus-square-o"];
        [self.keyCharForFontAwesome setValue:@"0xf148" forKey:@"fa-level-up"];
        [self.keyCharForFontAwesome setValue:@"0xf149" forKey:@"fa-level-down"];
        [self.keyCharForFontAwesome setValue:@"0xf14a" forKey:@"fa-check-square"];
        [self.keyCharForFontAwesome setValue:@"0xf14b" forKey:@"fa-pencil-square"];
        [self.keyCharForFontAwesome setValue:@"0xf14c" forKey:@"fa-external-link-square"];
        [self.keyCharForFontAwesome setValue:@"0xf14d" forKey:@"fa-share-square"];
        [self.keyCharForFontAwesome setValue:@"0xf14e" forKey:@"fa-compass"];
        [self.keyCharForFontAwesome setValue:@"0xf150" forKey:@"fa-caret-square-o-down"];
        [self.keyCharForFontAwesome setValue:@"0xf151" forKey:@"fa-caret-square-o-up"];
        [self.keyCharForFontAwesome setValue:@"0xf152" forKey:@"fa-caret-square-o-right"];
        [self.keyCharForFontAwesome setValue:@"0xf153" forKey:@"fa-eur"];
        [self.keyCharForFontAwesome setValue:@"0xf154" forKey:@"fa-gbp"];
        [self.keyCharForFontAwesome setValue:@"0xf155" forKey:@"fa-usd"];
        [self.keyCharForFontAwesome setValue:@"0xf156" forKey:@"fa-inr"];
        [self.keyCharForFontAwesome setValue:@"0xf157" forKey:@"fa-jpy"];
        [self.keyCharForFontAwesome setValue:@"0xf158" forKey:@"fa-rub"];
        [self.keyCharForFontAwesome setValue:@"0xf159" forKey:@"fa-krw"];
        [self.keyCharForFontAwesome setValue:@"0xf15a" forKey:@"fa-btc"];
        [self.keyCharForFontAwesome setValue:@"0xf15b" forKey:@"fa-file"];
        [self.keyCharForFontAwesome setValue:@"0xf15c" forKey:@"fa-file-text"];
        [self.keyCharForFontAwesome setValue:@"0xf15d" forKey:@"fa-sort-alpha-asc"];
        [self.keyCharForFontAwesome setValue:@"0xf15e" forKey:@"fa-sort-alpha-desc"];
        [self.keyCharForFontAwesome setValue:@"0xf160" forKey:@"fa-sort-amount-asc"];
        [self.keyCharForFontAwesome setValue:@"0xf161" forKey:@"fa-sort-amount-desc"];
        [self.keyCharForFontAwesome setValue:@"0xf162" forKey:@"fa-sort-numeric-asc"];
        [self.keyCharForFontAwesome setValue:@"0xf163" forKey:@"fa-sort-numeric-desc"];
        [self.keyCharForFontAwesome setValue:@"0xf164" forKey:@"fa-thumbs-up"];
        [self.keyCharForFontAwesome setValue:@"0xf165" forKey:@"fa-thumbs-down"];
        [self.keyCharForFontAwesome setValue:@"0xf166" forKey:@"fa-youtube-square"];
        [self.keyCharForFontAwesome setValue:@"0xf167" forKey:@"fa-youtube"];
        [self.keyCharForFontAwesome setValue:@"0xf168" forKey:@"fa-xing"];
        [self.keyCharForFontAwesome setValue:@"0xf169" forKey:@"fa-xing-square"];
        [self.keyCharForFontAwesome setValue:@"0xf16a" forKey:@"fa-youtube-play"];
        [self.keyCharForFontAwesome setValue:@"0xf16b" forKey:@"fa-dropbox"];
        [self.keyCharForFontAwesome setValue:@"0xf16c" forKey:@"fa-stack-overflow"];
        [self.keyCharForFontAwesome setValue:@"0xf16d" forKey:@"fa-instagram"];
        [self.keyCharForFontAwesome setValue:@"0xf16e" forKey:@"fa-flickr"];
        [self.keyCharForFontAwesome setValue:@"0xf170" forKey:@"fa-adn"];
        [self.keyCharForFontAwesome setValue:@"0xf171" forKey:@"fa-bitbucket"];
        [self.keyCharForFontAwesome setValue:@"0xf172" forKey:@"fa-bitbucket-square"];
        [self.keyCharForFontAwesome setValue:@"0xf173" forKey:@"fa-tumblr"];
        [self.keyCharForFontAwesome setValue:@"0xf174" forKey:@"fa-tumblr-square"];
        [self.keyCharForFontAwesome setValue:@"0xf175" forKey:@"fa-long-arrow-down"];
        [self.keyCharForFontAwesome setValue:@"0xf176" forKey:@"fa-long-arrow-up"];
        [self.keyCharForFontAwesome setValue:@"0xf177" forKey:@"fa-long-arrow-left"];
        [self.keyCharForFontAwesome setValue:@"0xf178" forKey:@"fa-long-arrow-right"];
        [self.keyCharForFontAwesome setValue:@"0xf179" forKey:@"fa-apple"];
        [self.keyCharForFontAwesome setValue:@"0xf17a" forKey:@"fa-windows"];
        [self.keyCharForFontAwesome setValue:@"0xf17b" forKey:@"fa-android"];
        [self.keyCharForFontAwesome setValue:@"0xf17c" forKey:@"fa-linux"];
        [self.keyCharForFontAwesome setValue:@"0xf17d" forKey:@"fa-dribbble"];
        [self.keyCharForFontAwesome setValue:@"0xf17e" forKey:@"fa-skype"];
        [self.keyCharForFontAwesome setValue:@"0xf180" forKey:@"fa-foursquare"];
        [self.keyCharForFontAwesome setValue:@"0xf181" forKey:@"fa-trello"];
        [self.keyCharForFontAwesome setValue:@"0xf182" forKey:@"fa-female"];
        [self.keyCharForFontAwesome setValue:@"0xf183" forKey:@"fa-male"];
        [self.keyCharForFontAwesome setValue:@"0xf184" forKey:@"fa-gittip"];
        [self.keyCharForFontAwesome setValue:@"0xf185" forKey:@"fa-sun-o"];
        [self.keyCharForFontAwesome setValue:@"0xf186" forKey:@"fa-moon-o"];
        [self.keyCharForFontAwesome setValue:@"0xf187" forKey:@"fa-archive"];
        [self.keyCharForFontAwesome setValue:@"0xf188" forKey:@"fa-bug"];
        [self.keyCharForFontAwesome setValue:@"0xf189" forKey:@"fa-vk"];
        [self.keyCharForFontAwesome setValue:@"0xf18a" forKey:@"fa-weibo"];
        [self.keyCharForFontAwesome setValue:@"0xf18b" forKey:@"fa-renren"];
        [self.keyCharForFontAwesome setValue:@"0xf18c" forKey:@"fa-pagelines"];
        [self.keyCharForFontAwesome setValue:@"0xf18d" forKey:@"fa-stack-exchange"];
        [self.keyCharForFontAwesome setValue:@"0xf18e" forKey:@"fa-arrow-circle-o-right"];
        [self.keyCharForFontAwesome setValue:@"0xf190" forKey:@"fa-arrow-circle-o-left"];
        [self.keyCharForFontAwesome setValue:@"0xf191" forKey:@"fa-caret-square-o-left"];
        [self.keyCharForFontAwesome setValue:@"0xf192" forKey:@"fa-dot-circle-o"];
        [self.keyCharForFontAwesome setValue:@"0xf193" forKey:@"fa-wheelchair"];
        [self.keyCharForFontAwesome setValue:@"0xf194" forKey:@"fa-vimeo-square"];
        [self.keyCharForFontAwesome setValue:@"0xf195" forKey:@"fa-try"];
        [self.keyCharForFontAwesome setValue:@"0xf196" forKey:@"fa-plus-square-o"];
       
    }
    return self;
}

+ (SyncData*)get
{
    if (__mainData == nil) {
        __mainData = [[super allocWithZone:NULL] init];
        
    }
    return __mainData;
}

- (void)mock{

}
+(NSMutableArray*)getAllCity{

    NSMutableArray *temp = [[NSMutableArray alloc]init];
    
    AppDelegate * appDelagate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context =appDelagate.managedObjectContext;
    
    
    //get object from database
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"City"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (City *city in fetchedObjects) {
       
        
        [temp addObject:city];
       
    }
    
    NSArray *cities =@[@"Velika Kladusa", @"Sarajevo", @"Bihac", @"Mostar", @"Tuzla", @"Zenica"];
   
    if ([temp count]==0) {
        
         NSError *error;
        for (int i=0; i<cities.count; i++) {
            
            City *city = [NSEntityDescription
                          insertNewObjectForEntityForName:@"City"
                          inManagedObjectContext:context];
            
            city.city=[cities objectAtIndex:i];
            [context save:nil];
            if (![context save:&error]) {
                NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
            }
            else{
                
                [temp addObject:city];
            }
            
        }
    }
    
    return temp;
}



@end
