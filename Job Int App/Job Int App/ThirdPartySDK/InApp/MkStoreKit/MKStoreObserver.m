//
//  MKStoreObserver.m
//
//  Created by Mugunth Kumar on 17-Oct-09.
//  Copyright 2009 Mugunth Kumar. All rights reserved.
//

#import "MKStoreObserver.h"
#import "MKStoreManager.h"

@implementation MKStoreObserver

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
	for (SKPaymentTransaction *transaction in transactions)
	{
		switch (transaction.transactionState)
		{
			case SKPaymentTransactionStatePurchased:
				
                [self completeTransaction:transaction];
				
                break;
				
            case SKPaymentTransactionStateFailed:
				
                [self failedTransaction:transaction];
				
                break;
				
            case SKPaymentTransactionStateRestored:
				
                [self restoreTransaction:transaction];
				
            default:
				
                break;
		}			
	}
}

- (void) failedTransaction: (SKPaymentTransaction *)transaction{	
    if (transaction.error.code != SKErrorPaymentCancelled){		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"The upgrade procedure failed" message:@"Please check your Internet connection and your App Store account information." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
		[alert show];
		[alert release];	
    }	
	
	NSLog(@"Fallo - Observer");
    [[MKStoreManager sharedManager].pDelegate storeManagerAlertShowed];
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];	
}

- (void) completeTransaction: (SKPaymentTransaction *)transaction
{		
	NSLog(@"Completo - Observer");
    [[MKStoreManager sharedManager] provideContent: transaction.payment.productIdentifier];	
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];	
}

- (void) restoreTransaction: (SKPaymentTransaction *)transaction
{	
	NSLog(@"Restaurando - Observer");
    [[MKStoreManager sharedManager] provideContent: transaction.originalTransaction.payment.productIdentifier];	
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];	
}

- (void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue
{
    UIAlertView * alertView = [[[UIAlertView alloc] initWithTitle:@"Restore successful!"
												message:@""
												delegate:nil
												cancelButtonTitle:@"Ok"
												otherButtonTitles:nil]
                                                autorelease];
	[alertView show];    
    [[MKStoreManager sharedManager].pDelegate storeManagerAlertShowed];
}

- (void)paymentQueue:(SKPaymentQueue *)queue 
restoreCompletedTransactionsFailedWithError:(NSError *)error
{
    UIAlertView * alertView = [[[UIAlertView alloc] initWithTitle:@"Restore unsuccessful!"
														  message:@""
														 delegate:nil
												cancelButtonTitle:@"Ok"
												otherButtonTitles:nil]
							   autorelease];
	[alertView show]; 
    [[MKStoreManager sharedManager].pDelegate storeManagerAlertShowed];
}

@end
