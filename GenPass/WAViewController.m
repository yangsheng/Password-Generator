//
//  WAViewController.m
//  GenPass
//
//  Created by Yurii Martynchyk on 29.11.13.
//  Copyright (c) 2013 Yurii Martynchyk. All rights reserved.
//

#import "WAViewController.h"

@interface WAViewController ()
@property (nonatomic, strong) NSString *letters;
@property (nonatomic, strong) NSMutableString *password;
@property (nonatomic, strong) NSString *randomString;
@end


static NSString *const kLowerCase = @"abcdefghijklmnopqrstuvwxyz";
static NSString *const kUpperCase = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
static NSString *const kNumbers = @"0123456789";
static NSString *const kSpecialSym = @"!@#$%^&*()_+-=";

@implementation WAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (IBAction)upperCaseSwitch:(id)sender{}
- (IBAction)lowerCaseSwitch:(id)sender{}
- (IBAction)numberSwitch:(id)sender{}
- (IBAction)specialSymSwitch:(id)sender{}



-(NSString *) genRandStringLength
{
	NSMutableString *passString = [NSMutableString string];
	if (_upperCaseSwitch.on) {
		[passString appendString:kUpperCase];
	}
	if (_lowerCaseSwitch.on) {
		[passString appendString:kLowerCase];
	}
	if (_numberSwitch.on) {
		[passString appendString:kNumbers];
	}
	if (_specialSymSwitch.on) {
		[passString appendString:kSpecialSym];
	}

	NSUInteger theLenght = [[self.passLength text] integerValue];
	
	NSMutableString *randomString = [NSMutableString stringWithCapacity:theLenght];
	for (NSUInteger inIndex = 0; inIndex < theLenght && 0 != passString.length; ++inIndex)
	{
		[randomString appendFormat:@"%C", [passString characterAtIndex:arc4random_uniform((u_int32_t)passString.length)]];
	}

	return randomString.length ? randomString : @"Nothing to generate";

}
	


- (IBAction)generatePassword:(id)sender
{
	self.readyPassword.text = [self genRandStringLength];
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	
	[self.passLength resignFirstResponder];
	
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}


- (IBAction)showEmail:(id)sender {
    
    NSString *emailTitle = @"Generated password";
    NSString *messageBody = self.readyPassword.text;
    NSArray *toRecipents = [NSArray arrayWithObject:@"example@email.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (IBAction)showSMS:(id)sender
{
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init] ;
    if([MFMessageComposeViewController canSendText])
    {
        controller.body = @"Hello Friends this is sample text message.";
        controller.recipients = [NSArray arrayWithObjects:@"+919999999999", nil];
        controller.messageComposeDelegate = self;
        [self presentModalViewController:controller animated:YES];
}
}

- (void) mailComposeController:(MFMailComposeViewController *)controller
{
  
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
