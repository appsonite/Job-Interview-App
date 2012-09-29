//
//  MKStoreManager.m
//
//  Created by Mugunth Kumar on 17-Oct-09.
//  Copyright 2009 Mugunth Kumar. All rights reserved.
//  mugunthkumar.com
//

#import "MKStoreManager.h"

@implementation MKStoreManager

@synthesize purchasableObjects;	
@synthesize storeObserver;
@synthesize pDelegate;


static NSString *featureCheckList = @"com.MWS.aChecklist";
static NSString *featureFlipcardDifficult = @"com.MWS.aFlipcardDifficult";
static NSString *featureFlipcardAccounting = @"com.MWS.aFlipcardAccounting";
static NSString *featureFlipcardEngineering = @"com.MWS.aFlipcardEngineering";
static NSString *featureFlipcardFinance = @"com.MWS.aFlipcardFinance";
static NSString *featureFlipcardGeneral = @"com.MWS.aFlipcardGeneral";
static NSString *featureFlipcardSales = @"com.MWS.aFlipcardSales";


BOOL featureCheckListPurchsed;
BOOL featureFlipcardAccountingPurchased;
BOOL featureFlipcardDifficultPurchased;
BOOL featureFlipcardEngineeringPurchased;
BOOL featureFlipcardFinancePurchased;
BOOL featureFlipcardGeneralPurchased;
BOOL featureFlipcardSalesPurchased;

static MKStoreManager* _sharedStoreManager; // self

- (void)dealloc {
	[_sharedStoreManager release];
	[storeObserver release];
	[super dealloc];
}

+ (BOOL) featureCheckListPurchsed
{
    return featureCheckListPurchsed;
}

+ (BOOL) featureFlipcardAccountingPurchased
{
    return featureFlipcardAccountingPurchased;
}

+ (BOOL) featureFlipcardDifficultPurchased
{
    return featureFlipcardDifficultPurchased;
}

+ (BOOL) featureFlipcardEngineeringPurchased
{
    return featureFlipcardEngineeringPurchased;
}

+ (BOOL) featureFlipcardFinancePurchased
{
    return featureFlipcardFinancePurchased;
}

+ (BOOL) featureFlipcardGeneralPurchased
{
    return featureFlipcardGeneralPurchased;
}

+ (BOOL) featureFlipcardSalesPurchased
{
    return featureFlipcardSalesPurchased;
}


+ (MKStoreManager*)sharedManager
{
	@synchronized(self) {
		
        if (_sharedStoreManager == nil) {
			
            [[self alloc] init]; // assignment not done here
			_sharedStoreManager.purchasableObjects = [[NSMutableArray alloc] init];			
			[_sharedStoreManager requestProductData];
				
			[MKStoreManager loadPurchases];
			_sharedStoreManager.storeObserver = [[MKStoreObserver alloc] init];
			[[SKPaymentQueue defaultQueue] addTransactionObserver:_sharedStoreManager.storeObserver];
        }
    }
    return _sharedStoreManager;
}


#pragma mark Singleton Methods

+ (id)allocWithZone:(NSZone *)zone

{	
    @synchronized(self) {
		
        if (_sharedStoreManager == nil) {
			
            _sharedStoreManager = [super allocWithZone:zone];			
            return _sharedStoreManager;  // assignment and return on first allocation
        }
    }
	
    return nil; //on subsequent allocation attempts return nil	
}


- (id)copyWithZone:(NSZone *)zone
{
    return self;	
}

- (id)retain
{	
    return self;	
}

- (unsigned)retainCount
{
    return UINT_MAX;  //denotes an object that cannot be released
}

- (id)autorelease
{
    return self;	
}


- (void) requestProductData
{
	SKProductsRequest *request= [[SKProductsRequest alloc] initWithProductIdentifiers: 
								 [NSSet setWithObjects: featureCheckList, featureFlipcardAccounting, featureFlipcardDifficult, featureFlipcardEngineering, featureFlipcardFinance, featureFlipcardGeneral, featureFlipcardSales, nil]]; // add any other product here
	request.delegate = self;
	[request start];
}


- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
	[purchasableObjects addObjectsFromArray:response.products];
        
	// populate your UI Controls here
	for(int i=0;i<[purchasableObjects count];i++)
	{
		
		//SKProduct *product = [purchasableObjects objectAtIndex:i];
		//NSLog(@"Feature: %@, Cost: %f, ID: %@",[product localizedTitle],
		//	  [[product price] doubleValue], [product productIdentifier]);  
	}
	
	[request autorelease];
}

- (void) buyFeature:(NSString*) featureId
{
	if ([SKPaymentQueue canMakePayments])
	{
		SKPayment *payment = [SKPayment paymentWithProductIdentifier:featureId];
		[[SKPaymentQueue defaultQueue] addPayment:payment];
	}
	else
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"You are not authorized to purchase from AppStore"
													   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
		[alert show];
		[alert release];
        [self.pDelegate storeManagerAlertShowed];
	}
}

- (void) buyFeatureChecklist
{
	[self buyFeature:featureCheckList];
    
}

- (void) buyFeatureFlipcardGeneral
{
	[self buyFeature:featureFlipcardGeneral];
}

- (void) buyFeatureFlipcardDifficult
{
	[self buyFeature:featureFlipcardDifficult];
}

- (void) buyFeatureFlipcardAccounting
{
	[self buyFeature:featureFlipcardAccounting];
}		
- (void) buyFeatureFlipcardEngineering
{
	[self buyFeature:featureFlipcardEngineering];    
}

- (void) buyFeatureFlipcardFinance
{
	[self buyFeature:featureFlipcardFinance];
}

- (void) buyFeatureFlipcardSales
{
	[self buyFeature:featureFlipcardSales];
}


- (void) failedTransaction: (SKPaymentTransaction *)transaction
{
	NSString *messageToBeShown = [NSString stringWithFormat:@"Reason: %@, You can try: %@", [transaction.error localizedFailureReason], [transaction.error localizedRecoverySuggestion]];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unable to complete your purchase" message:messageToBeShown
												   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
	[alert show];
	[alert release];
	NSLog(@"Fallo - Manager");
    [self.pDelegate storeManagerAlertShowed];
}

-(void) provideContent: (NSString*) productIdentifier
{
    if([productIdentifier isEqualToString:featureCheckList])
	{
        featureCheckListPurchsed = YES;
    }
	else if([productIdentifier isEqualToString:featureFlipcardSales])
	{
        featureFlipcardSalesPurchased = YES;
    }
    else if([productIdentifier isEqualToString:featureFlipcardGeneral])
    {
        featureFlipcardGeneralPurchased = YES;
    }
    else if([productIdentifier isEqualToString:featureFlipcardFinance])
    {
        featureFlipcardFinancePurchased = YES;
    }
    else if([productIdentifier isEqualToString:featureFlipcardEngineering])
	{
        featureFlipcardEngineeringPurchased = YES;
    }
	else if([productIdentifier isEqualToString:featureFlipcardAccounting])
	{
        featureFlipcardAccountingPurchased = YES;
    }
    else if([productIdentifier isEqualToString:featureFlipcardDifficult])
    {
        featureFlipcardDifficultPurchased = YES;
    }
    
    [MKStoreManager updatePurchases];
    [self.pDelegate purchaseSuccessfullyDoned];
}

- (void)restoreAllPurchases
{
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

+(void) loadPurchases 
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];	
	featureCheckListPurchsed = [userDefaults boolForKey:featureCheckList]; 
	featureFlipcardAccountingPurchased = [userDefaults boolForKey:featureFlipcardAccounting]; 	
  	featureFlipcardDifficultPurchased = [userDefaults boolForKey:featureFlipcardDifficult];
   	featureFlipcardFinancePurchased = [userDefaults boolForKey:featureFlipcardFinance];
	featureFlipcardGeneralPurchased = [userDefaults boolForKey:featureFlipcardGeneral]; 
	featureFlipcardSalesPurchased = [userDefaults boolForKey:featureFlipcardSales]; 	
    featureFlipcardEngineeringPurchased = [userDefaults boolForKey:featureFlipcardEngineering];
}

+(void) updatePurchases
{
	NSLog(@"Actualiza boleanos - Manager");
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	[userDefaults setBool:featureCheckListPurchsed forKey:featureCheckList];
	[userDefaults setBool:featureFlipcardEngineeringPurchased forKey:featureFlipcardEngineering];
    [userDefaults setBool:featureFlipcardDifficultPurchased forKey:featureFlipcardDifficult];
    [userDefaults setBool:featureFlipcardAccountingPurchased forKey:featureFlipcardAccounting];
    [userDefaults setBool:featureFlipcardFinancePurchased forKey:featureFlipcardFinance];
	[userDefaults setBool:featureFlipcardGeneralPurchased forKey:featureFlipcardGeneral];
    [userDefaults setBool:featureFlipcardSalesPurchased forKey:featureFlipcardSales];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
