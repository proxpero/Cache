//
//  Cache.h
//  Cache
//
//  Created by Todd Olsen on 11/1/16.
//
//

#if TARGET_OS_MAC
@import AppKit;
#elseif TARGET_OS_IOS
@import UIKit;
//#elseif TARGET_OS_TVOS
//    @import TVKit;
#endif

//! Project version number for Cache.
extern double CacheVersionNumber;

//! Project version string for Cache.
extern const unsigned char CacheVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <Cache/PublicHeader.h>


