//
//  File.c
//  LogParse
//
//  Created by haibo zhang on 11/8/13.
//  Copyright (c) 2013 DaFeng. All rights reserved.
//

#include <stdio.h>
/*
 日志例子
 123.125.89.21:80 1.27.80.98 [08/Nov/2013:15:00:00 +0800] "GET /37/26/92/letv-uts/8014991-AVC-254424-AAC-31586-2704520-100913173-a0938ea193ee2382f423e5f541a6618b-1383757935973.letv?crypt=2aa7f2e72&b=298&nlh=3072&nlt=15&bf=19&gn=706&p2p=1&video_type=flv&opck=1&check=0&tm=1384325400&key=95e9c5cc3cc486fca954fb728a7abc6a&proxy=2071812439%252C2007487120&cips=123.125.81.250&geo=CN-1-12-2&lgn=letv&mmsid=3354297&platid=1&splatid=101&playid=0&tss=no&termid=1&hwtype=un&ostype=Windows7&pay=0&tag=letv&sign=client_letvclient&rateid=1300 HTTP/1.1" 206 2 0.000 "-" "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.76 Safari/537.36" "-" 123.125.89.21 HIT 21775 bytes=0-1
 119.188.122.10:80 27.214.107.0 [08/Nov/2013:15:00:00 +0800] "GET /m3u8/guizhou/desc.m3u8?tag=live&video_type=m3u8&stream_id=guizhou&useloc=0&mslice=3&path=119.188.122.3,60.217.237.131,60.217.237.225&geo=CN-15-191-2&cips=27.214.107.0&tmn=1383893996&pnl=751,750,225 HTTP/1.1" 200 744 0.005 "-" "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)" "-" 119.188.122.10 MISS 35897 -
 119.188.122.10:443 119.186.35.185 [08/Nov/2013:15:00:00 +0800] "GET /35/32/68/letv-uts/7558296-AVC-936223-AAC-123237-2736640-373918437-af66cc8c5a460c1b3ef265fa511a5ea8-1382694440834.letv?crypt=56aa7f2e341&b=1093&nlh=3072&nlt=15&bf=25&gn=751&p2p=1&video_type=flv&opck=1&check=0&tm=1384325400&key=991de37e77f80d904169a4fc96c48d89&proxy=1872838930,2071812437&cips=119.186.35.185&geo=CN-15-196-2&lgn=letv&mmsid=3255115&platid=1&splatid=101&playid=0&tss=no&termid=1&hwtype=un&ostype=Windows%20XP&pay=0&tag=letv&sign=letv&tn=0.2899792166426778&rateid=1300&rstart=269746176&rend=273940479 HTTP/1.1" 200 4194304 12.673 "http://player.letvcdn.com/p/201309/26/newplayer/1422/FPLetvPlayer.swf" "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; 2345Explorer)" "-" 119.188.122.10 HIT 35458 -
 119.188.122.10:80 27.196.11.204 [08/Nov/2013:15:00:00 +0800] "GET /m3u8/cctvshaoer/desc.m3u8?tag=live&video_type=m3u8&stream_id=cctvshaoer&useloc=0&mslice=3&path=60.217.237.138,60.217.237.225&geo=CN-15-191-2&cips=27.196.11.204&tmn=1383890906&pnl=751,750,225 HTTP/1.1" 200 714 0.004 "-" "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)" "-" 119.188.122.10 MISS 35910 -
 */

struct logObj{
    char* serverip;
    char* userip;
    char* path;
    char* query;
    long contlength;
    long download;
    char* pid;
    char* spid;
    char* yewu;
    char* tag;
    char* sign;
    char* playid;
    char* httpcode;
    char* filetype;
    long maliu;
    int isHit;
    char* QS;
};

struct logObj logPaser(char* log){
    struct logObj;
    
    
};