//
//  TOLAdApaterGoogleAdsInterstitial.h
//  Pods
//
//  Created by Bruno Dal Bó Silva on 12/2/14.
//
//

#import <Foundation/Foundation.h>

#import "GADInterstitial.h"
#import "TOLAdAdapter.h"
#import "LARSAdController.h"

@interface TOLAdApaterGoogleAdsInterstitial : NSObject <GADInterstitialDelegate,TOLAdAdapter>

@property (strong,nonatomic) GADInterstitial * interstitial;
@property (weak, nonatomic) UIViewController *parentViewController;
@property (weak, nonatomic) id<LARSAdControllerDelegate> adManager;
@property (copy, nonatomic) NSString *publisherId;
@property (nonatomic) BOOL adVisible;


@end
