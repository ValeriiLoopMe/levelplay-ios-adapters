//
//  ISVungleRewardedVideoDelegate.h
//  ISVungleAdapter
//
//  Copyright © 2023 ironSource. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <VungleAdsSDK/VungleAdsSDK.h>
#import <IronSource/ISBaseAdapter+Internal.h>

NS_ASSUME_NONNULL_BEGIN

@interface ISVungleRewardedVideoDelegate : NSObject<VungleRewardedDelegate>

@property (nonatomic, strong) NSString *placementId;
@property (nonatomic, weak) id<ISRewardedVideoAdapterDelegate> delegate;

- (instancetype)initWithPlacementId:(NSString *)placementId
                        andDelegate:(id<ISRewardedVideoAdapterDelegate>)delegate;
@end

NS_ASSUME_NONNULL_END
