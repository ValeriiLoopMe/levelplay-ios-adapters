//
//  ISUnityAdsRewardedVideoListener.h
//  ISUnityAdsAdapter
//
//  Copyright © 2022 ironSource Mobile Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UnityAds/UnityAds.h>
#import "ISUnityAdsAdapter.h"

@protocol ISUnityAdsRewardedVideoDelegateWrapper <NSObject>

- (void)onRewardedVideoDidLoad:(NSString * _Nonnull)placementId;
- (void)onRewardedVideoDidFailToLoad:(NSString * _Nonnull)placementId
                           withError:(UnityAdsLoadError)error;
- (void)onRewardedVideoDidOpen:(NSString * _Nonnull)placementId;
- (void)onRewardedVideoShowFail:(NSString * _Nonnull)placementId
                      withError:(UnityAdsShowError)error
                     andMessage:(NSString * _Nonnull)errorMessage;
- (void)onRewardedVideoDidClick:(NSString * _Nonnull)placementId;
- (void)onRewardedVideoDidShowComplete:(NSString * _Nonnull)placementId
                       withFinishState:(UnityAdsShowCompletionState)state;

@end

@interface ISUnityAdsRewardedVideoListener : NSObject <UnityAdsLoadDelegate, UnityAdsShowDelegate>

@property (nonatomic, weak)   id<ISUnityAdsRewardedVideoDelegateWrapper> _Nullable delegate;
@property (nonatomic, strong) NSString * _Nonnull placementId;

- (instancetype _Nonnull) initWithPlacementId:(NSString * _Nonnull)placementId
                                  andDelegate:(id<ISUnityAdsRewardedVideoDelegateWrapper> _Nonnull)delegate;

@end

