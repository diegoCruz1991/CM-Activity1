//
//  AddNew.h
//  CM-Activity1
//
//  Created by Diego Alejandro Cruz Ramirez on 17/06/15.
//  Copyright (c) 2015 AdHoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNew : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

/////////Text fields/////////////
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtAge;
@property (strong, nonatomic) IBOutlet UITextView *txtViewDesc;

//////////Images/////////////////
@property (strong, nonatomic) IBOutlet UIImageView *imgAddImg;

//////////Action buttons///////////
- (IBAction)btnAdd:(id)sender;
- (IBAction)btnAddNewImg:(id)sender;
- (IBAction)btnCancel:(id)sender;

/////////Button Outlets//////////////
@property (strong, nonatomic) IBOutlet UIButton *btnAddImgProp;

@end
