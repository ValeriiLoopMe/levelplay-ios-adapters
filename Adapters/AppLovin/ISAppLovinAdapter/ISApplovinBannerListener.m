//
//  ISApplovinBannerListener.m
//  ISApplovinAdapter
//
//  Created by Dor Alon on 16/09/2018.
//  Copyright © 2018 IronSource. All rights reserved.
//

#import "ISApplovinBannerListener.h"

@implementation ISApplovinBannerListener

- (instancetype)initWithZoneId:(NSString *)zoneId
                   andDelegate:(id<ISApplovinBannerListenerDelegate>)delegate{
    self = [super init];
    
    if (self) {
        _delegate = delegate;
        _zoneId = zoneId;
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
- (void)adService:(ALAdService *)adService
        didLoadAd:(ALAd *)ad {
    [_delegate onBannerLoadSuccess:ad
                            zoneID:_zoneId];
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
    [_delegate onBannerLoadFail:_zoneId
                          error:code];
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
    [_delegate onBannerDidShow:view
                        zoneID:_zoneId];

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
    [_delegate onBannerDidClick:_zoneId];
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
}

#pragma mark - ALAdViewEventDelegate


/**
 * The SDK invokes this method when the user is about to be taken out of the application after the user clicks on the ad.
 *
 * The SDK invokes this method on the main UI thread.
 *
 * @param ad     Ad for which the user will be taken out of the application.
 * @param adView Ad view that contains the ad for which the user will be taken out of the application.
 */
- (void)ad:(ALAd *)ad willLeaveApplicationForAdView:(ALAdView *)adView {
    [_delegate onBannerWillLeaveApplication:_zoneId];
}


/**
 * The SDK invokes this method after the ad view begins to present fullscreen content.
 *
 * The SDK invokes this method on the main UI thread.
 *
 * Note: Some banners, when clicked, will expand into fullscreen content, whereupon the SDK will call this method.
 *
 * @param ad     Ad for which the ad view presented fullscreen content.
 * @param adView Ad view that presented fullscreen content.
 */
- (void)ad:(ALAd *)ad didPresentFullscreenForAdView:(ALAdView *)adView {
    [_delegate onBannerDidPresentFullscreen:_zoneId];
}

/**
 * The SDK invokes this method after the fullscreen content is dismissed.
 *
 * The SDK invokes this method on the main UI thread.
 *
 * @param ad     Ad for which the fullscreen content is dismissed.
 * @param adView Ad view that contains the ad for which the fullscreen content is dismissed.
 */
- (void)ad:(ALAd *)ad didDismissFullscreenForAdView:(ALAdView *)adView {
    [_delegate onBannerDidDismissFullscreen:_zoneId];
}

@end
