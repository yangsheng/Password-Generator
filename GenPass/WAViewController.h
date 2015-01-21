//
//  WAViewController.h
//  GenPass
//
//  Created by Yurii Martynchyk on 29.11.13.
//  Copyright (c) 2013 Yurii Martynchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface WAViewController : UIViewController < UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *passLength;
@property (weak, nonatomic) IBOutlet UISwitch *upperCaseSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *lowerCaseSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *numberSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *specialSymSwitch;
- (IBAction)generatePassword:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *readyPassword;
- (IBAction)showEmail:(id)sender;

- (IBAction)showSMS:(id)sender;

@end
