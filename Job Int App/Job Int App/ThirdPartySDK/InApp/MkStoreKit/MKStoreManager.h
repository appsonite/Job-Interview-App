//
//  StoreManager.h
//  MKSync
//
//  Created by Mugunth Kumar on 17-Oct-09.
//  Copyright 2009 MK Inc. All rights reserved.
//  mugunthkumar.com

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>
#import "MKStoreObserver.h"

@protocol MKStoreManagerDelegate
-(void) storeManagerAlertShowed;
-(void) purchaseSuccessfullyDoned;
@end

@interface MKStoreManager : NSObject<SKProductsRequestDelegate> {

	NSMutableArray *purchasableObjects;
	MKStoreObserver *storeObserver;		
}

@property (nonatomic, retain) NSMutableArray *purchasableObjects;
@property (nonatomic, retain) MKStoreObserver *storeObserver;
@property (nonatomic, assign) id<MKStoreManagerDelegate> pDelegate;

- (void) requestProductData;

- (void) buyFeatureChecklist;
- (void) buyFeatureFlipcardGeneral;
- (void) buyFeatureFlipcardSales;
- (void) buyFeatureFlipcardFinance;
- (void) buyFeatureFlipcardEngineering;
- (void) buyFeatureFlipcardAccounting;
- (void) buyFeatureFlipcardDifficult;

- (void) restoreAllPurchases;

// do not call this directly. This is like a private method
- (void) buyFeature:(NSString*) featureId;

- (void) failedTransaction: (SKPaymentTransaction *)transaction;
- (void) provideContent: (NSString*) productIdentifier;

+ (MKStoreManager*)sharedManager;

+ (BOOL) featureCheckListPurchsed;
+ (BOOL) featureFlipcardAccountingPurchased;
+ (BOOL) featureFlipcardEngineeringPurchased;
+ (BOOL) featureFlipcardFinancePurchased;
+ (BOOL) featureFlipcardGeneralPurchased;
+ (BOOL) featureFlipcardSalesPurchased;
+ (BOOL) featureFlipcardDifficultPurchased;

+(void) loadPurchases;
+(void) updatePurchases;

@end
