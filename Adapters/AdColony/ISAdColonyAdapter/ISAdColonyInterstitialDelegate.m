//
//  ISAdColonyInterstitialDelegate.m
//  ISAdColonyAdapter
//
//  Copyright © 2023 ironSource Mobile Ltd. All rights reserved.
//

#import <ISAdColonyInterstitialDelegate.h>

@implementation ISAdColonyInterstitialDelegate

- (instancetype)initWithZoneId:(NSString *)zoneId
                   andDelegate:(id<ISAdColonyInterstitialDelegateWrapper>)delegate {
    self = [super init];
    
    if (self) {
        _zoneId = zoneId;
        _delegate = delegate;
    }
    
    return self;
}

#pragma mark AdColonyInterstitialDelegate

/**
@abstract Did load notification
@discussion Notifies you when interstitial has been created, received an ad and is ready to use. Call is dispatched on main thread.
@param interstitial Loaded interstitial
*/
- (void)adColonyInterstitialDidLoad:(AdColonyInterstitial * _Nonnull)interstitial {
    [_delegate onInterstitialDidLoad:interstitial
                           forZoneId:_zoneId];
}

/**
 @abstract No ad notification
 @discussion Notifies you when SDK was not able to load an ad for requested zone. Call is dispatched on main thread.
 @param error Error with failure explanation
 */
- (void)adColonyInterstitialDidFailToLoad:(AdColonyAdRequestError * _Nonnull)error {
    [_delegate onInterstitialDidFailToLoad:_zoneId
                                 withError:error];
}

/**
 @abstract Open notification
 @discussion Notifies you when interstitial is going to show fullscreen content. Call is dispatched on main thread.
 @param interstitial interstitial ad object
 */
- (void)adColonyInterstitialWillOpen:(AdColonyInterstitial * _Nonnull)interstitial {
    [_delegate onInterstitialDidOpen:_zoneId];
}

/**
 @abstract Click notification
 @discussion Notifies you when the user taps on the interstitial causing the action to be taken. Call is dispatched on main thread.
 @param interstitial interstitial ad object
 */
- (void)adColonyInterstitialDidReceiveClick:(AdColonyInterstitial * _Nonnull)interstitial {
    [_delegate onInterstitialDidClick:_zoneId];
}

/**
 @abstract Expire notification
 @discussion Notifies you when an interstitial expires and is no longer valid for playback. This does not get triggered when the expired flag is set because it has been viewed. It's recommended to request a new ad within this callback. Call is dispatched on main thread.
 @param interstitial interstitial ad object
 */
- (void)adColonyInterstitialExpired:(AdColonyInterstitial * _Nonnull)interstitial {
}

/**
 @abstract Close notification
 @discussion Notifies you when interstitial dismissed fullscreen content. Call is dispatched on main thread.
 @param interstitial interstitial ad object
 */
- (void)adColonyInterstitialDidClose:(AdColonyInterstitial * _Nonnull)interstitial {
    [_delegate onInterstitialDidClose:_zoneId];
}


@end
