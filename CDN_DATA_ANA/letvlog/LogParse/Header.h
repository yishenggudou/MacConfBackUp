//
//  Header.h
//  LogParse
//
//  Created by haibo zhang on 11/8/13.
//  Copyright (c) 2013 DaFeng. All rights reserved.
//

#ifndef LogParse_Header_h
#define LogParse_Header_h

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
}


char* ip2idc(char* ip)

char* ip2area(char* ip)

char* ip2isp(char* ip)

bool* isSlowRequest(long maliu, long downspeed)

long getMaliu(char* path)

float getDownSpeed(float loaddowntime, long contlength)

char* getPlatId(char* query)

char* getSplatId(char* query)

char* getUA(char* log)

char* getPath(char* log)

char* getServerIp(char* log)

char* getUserIp(char* log)

char* 
#endif
