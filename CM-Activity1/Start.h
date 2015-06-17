//
//  ViewController.h
//  CM-Activity1
//
//  Created by Diego Alejandro Cruz Ramirez on 16/06/15.
//  Copyright (c) 2015 AdHoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Start : UIViewController<UITableViewDataSource, UITableViewDelegate>

///////Actions/////////
- (IBAction)btnAddNew:(id)sender;

//////Table outlet//////////////
@property (strong, nonatomic) IBOutlet UITableView *tblMain;

@end

