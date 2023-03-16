//
//  ISTapjoyAdapter.h
//  ISTapjoyAdapter
//
//  Copyright © 2023 ironSource Mobile Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IronSource/ISBaseAdapter+Internal.h>

static NSString * const TapjoyAdapterVersion = @"4.1.24";
static NSString * Githash = @"abe5c7bb3";

//System Frameworks For Tapjoy Adapter

@import AdSupport;
@import CFNetwork;
@import CoreServices;
@import CoreTelephony;
@import SystemConfiguration;
@import StoreKit;
@import UIKit;
@import WebKit;

@interface ISTapjoyAdapter : ISBaseAdapter

@end
