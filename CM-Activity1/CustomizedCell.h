//
//  CustomizedCell.h
//  CM-Activity1
//
//  Created by Diego Alejandro Cruz Ramirez on 16/06/15.
//  Copyright (c) 2015 AdHoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomizedCell : UITableViewCell

///////Labels///////
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblAge;

///////Images///////
@property (strong, nonatomic) IBOutlet UIImageView *imgCharacter;

@end
