//
//  ISChartboostInterstitialDelegate.h
//  ISChartboostAdapter
//
//  Created by Hadar Pur on 12/03/2020.
//  Copyright © 2020 ironSource. All rights reserved.
//

#import <ChartboostSDK/ChartboostSDK.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ISChartboostInterstitialDelegateWrapper <NSObject>

- (void)onInterstitialDidLoad:(nonnull NSString *)locationId;

- (void)onInterstitialDidFailToLoad:(nonnull NSString *)locationId
                          withError:(nonnull CHBCacheError *)error;

- (void)onInterstitialDidOpen:(nonnull NSString *)locationId;

- (void)onInterstitialShowFail:(nonnull NSString *)locationId
                     withError:(nonnull CHBShowError *)error;

- (void)onInterstitialDidClick:(nonnull NSString *)locationId
                     withError:(nullable CHBClickError *)error;


- (void)onInterstitialDidClose:(nonnull NSString *)locationId;

@end

@interface ISChartboostInterstitialDelegate : NSObject <CHBInterstitialDelegate>

@property (nonatomic, strong) NSString *locationId;
@property (nonatomic, weak)   id<ISChartboostInterstitialDelegateWrapper> delegate;

- (instancetype)initWithLocationId:(NSString *)locationId
                       andDelegate:(id<ISChartboostInterstitialDelegateWrapper>)delegate;

@end

NS_ASSUME_NONNULL_END
