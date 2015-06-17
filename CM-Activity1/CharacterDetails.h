//
//  CharacterDetailsViewController.h
//  CM-Activity1
//
//  Created by Diego Alejandro Cruz Ramirez on 16/06/15.
//  Copyright (c) 2015 AdHoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharacterDetails : UIViewController

//////Images//////////
@property (strong, nonatomic) IBOutlet UIImageView *imgCharacter;

//////Actions//////////
- (IBAction)btnBack:(id)sender;

//////Labels///////////
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;

@end
