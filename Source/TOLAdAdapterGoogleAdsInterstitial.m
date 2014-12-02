//
//  TOLAdApaterGoogleAdsInterstitial.m
//  Pods
//
//  Created by Bruno Dal Bó Silva on 12/2/14.
//
//

#import "TOLAdAdapterGoogleAdsInterstitial.h"

@implementation TOLAdApaterGoogleAdsInterstitial


+ (BOOL)allowsBanner {
    return NO;
}

+ (BOOL)allowsInterstitial {
    return YES;
}

- (void)dealloc {
    self.adManager = nil;
    self.publisherId = nil;
    
    self.interstitial = nil;
    
    TOLLog(@"Dealloc");
}


#pragma mark - Optional Adapter Implementation

- (NSString *)friendlyNetworkDescription {
    return @"Google Ads";
}



#pragma mark - Interstitial protocol implementation
- (void)loadInterstitial {
    self.interstitial = [[GADInterstitial alloc] init];
    self.interstitial.adUnitID = self.publisherId ;
    self.interstitial.delegate = self;
    
    GADRequest *request = [GADRequest request];
    // Requests test ads on simulators.
    request.testDevices = @[ GAD_SIMULATOR_ID ];
    [self.interstitial loadRequest:request];
}

- (void)displayInterstitial {
    if( _parentViewController != nil ) {
        if( self.interstitial != nil ) {
            if( self.interstitial.isReady ) {
                [self.interstitial presentFromRootViewController:_parentViewController];
                self.interstitial = nil; /* release it */
            }
        } else {
            TOLWLog(@"Attempting to display unallocated interstitial");
        }
    } else {
        TOLWLog(@"cannot display interstitial, controller does not have parent view");
    }
}

#pragma mark - GADInterstitial delegate methos
- (void)interstitialDidReceiveAd:(GADInterstitial *)ad {
    TOLLog(@"got interstitial ad");
}

- (void)interstitial:(GADInterstitial *)ad didFailToReceiveAdWithError:(GADRequestError *)error {
    TOLLog(@"failed to load interstitial ad");
}


@end
