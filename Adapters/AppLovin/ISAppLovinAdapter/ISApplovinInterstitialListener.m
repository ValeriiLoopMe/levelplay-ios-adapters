//
//  ISApplovinInterstitialListener.m
//  ISApplovinAdapter
//
//  Created by Dor Alon on 16/09/2018.
//  Copyright © 2018 IronSource. All rights reserved.
//

#import "ISApplovinInterstitialListener.h"

@implementation ISApplovinInterstitialListener


- (instancetype)initWithZoneId:(NSString *)zoneId
                   andDelegate:(id<ISApplovinInterstitialListenerDelegate>)delegate {
    self = [super init];
    
    if (self) {
        _zoneId = zoneId;
        _delegate = delegate;
    }
    
    return self;
}


#pragma mark - ALAdLoadDelegate

/**
 * The SDK invokes this method when an ad is loaded by the AdService.
 *
 * The SDK invokes this method on the main UI thread.
 *
 * @param adService AdService that loaded the ad.
 * @param ad        Ad that was loaded.
 */
- (void)adService:(ALAdService *)adService didLoadAd:(ALAd *)ad {
    [_delegate onInterstitialDidLoad:_zoneId
                                  ad:ad];
}

/**
 * The SDK invokes this method when an ad load fails.
 *
 * The SDK invokes this method on the main UI thread.
 *
 * @param adService AdService that failed to load an ad.
 * @param code      An error code that corresponds to one of the constants defined in ALErrorCodes.h.
 */
- (void)adService:(ALAdService *)adService didFailToLoadAdWithError:(int)code {
    [_delegate onInterstitialDidFailToLoadWithError:code
                                             zoneId:_zoneId];
}

#pragma mark - ALAdDisplayDelegate

/**
 * The SDK invokes this when the ad is displayed in the view.
 *
 * The SDK invokes this method on the main UI thread.
 *
 * @param ad    Ad that was just displayed.
 * @param view  Ad view in which the ad was displayed.
 */
- (void)ad:(ALAd *)ad wasDisplayedIn:(UIView *)view {
    [_delegate onInterstitialDidOpen:view
                              zoneId:_zoneId];
}

/**
 * The SDK invokes this method when the ad is clicked in the view.
 *
 * The SDK invokes this method on the main UI thread.
 *
 * @param ad    Ad that was just clicked.
 * @param view  Ad view in which the ad was clicked.
 */
- (void)ad:(ALAd *)ad wasClickedIn:(UIView *)view {
    [_delegate onInterstitialDidClick:view
                               zoneId:_zoneId];
}

/**
 * The SDK invokes this method when the ad is hidden from the view. This occurs when the user "X"es out of an interstitial.
 *
 * The SDK invokes this method on the main UI thread.
 *
 * @param ad    Ad that was just hidden.
 * @param view  Ad view in which the ad was hidden.
 */
- (void)ad:(ALAd *)ad wasHiddenIn:(UIView *)view {
    [_delegate onInterstitialDidClose:view
                               zoneId:_zoneId];
}

@end
