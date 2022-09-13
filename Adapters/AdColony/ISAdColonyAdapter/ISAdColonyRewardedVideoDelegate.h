//
//  ISAdColonyRewardedVideoDelegate.h
//  ISAdColonyAdapter
//
//  Created by Roi Eshel on 24/9/2019.
//  Copyright © 2019 IronSource. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AdColony/AdColony.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ISAdColonyRewardedVideoDelegateWrapper <NSObject>

- (void)onRewardedVideoDidLoad:(nonnull AdColonyInterstitial *)ad
                     forZoneId:(nonnull NSString *)zoneId;

- (void)onRewardedVideoDidFailToLoad:(nonnull NSString *)zoneId
                           withError:(nonnull AdColonyAdRequestError *)error;

- (void)onRewardedVideoDidOpen:(nonnull NSString *)zoneId;

- (void)onRewardedVideoDidClick:(nonnull NSString *)zoneId;

- (void)onRewardedVideoExpired:(nonnull NSString *)zoneId;

- (void)onRewardedVideoDidClose:(nonnull NSString *)zoneId;

@end

@interface ISAdColonyRewardedVideoDelegate : NSObject <AdColonyInterstitialDelegate>

@property (nonatomic, strong) NSString *zoneId;
@property (nonatomic, weak) id<ISAdColonyRewardedVideoDelegateWrapper> delegate;

- (instancetype)initWithZoneId:(NSString *)zoneId
                   andDelegate:(id<ISAdColonyRewardedVideoDelegateWrapper>)delegate;

@end

NS_ASSUME_NONNULL_END
