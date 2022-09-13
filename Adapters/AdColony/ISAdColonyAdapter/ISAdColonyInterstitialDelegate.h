//
//  ISAdColonyInterstitialDelegate.h
//  ISAdColonyAdapter
//
//  Created by Roi Eshel on 24/9/2019.
//  Copyright © 2019 IronSource. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AdColony/AdColony.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ISAdColonyInterstitialDelegateWrapper <NSObject>

- (void)onInterstitialDidLoad:(nonnull AdColonyInterstitial *)ad
                    forZoneId:(nonnull NSString *)zoneId;

- (void)onInterstitialDidFailToLoad:(nonnull NSString *)zoneId
                          withError:(nonnull AdColonyAdRequestError *)error;

- (void)onInterstitialDidOpen:(nonnull NSString *)zoneId;

- (void)onInterstitialDidClick:(nonnull NSString *)zoneId;

- (void)onInterstitialDidClose:(nonnull NSString *)zoneId;

@end

@interface ISAdColonyInterstitialDelegate : NSObject <AdColonyInterstitialDelegate>

@property (nonatomic, strong) NSString *zoneId;
@property (nonatomic, weak) id<ISAdColonyInterstitialDelegateWrapper> delegate;

- (instancetype)initWithZoneId:(NSString *)zoneId
                   andDelegate:(id<ISAdColonyInterstitialDelegateWrapper>)delegate;

@end

NS_ASSUME_NONNULL_END
