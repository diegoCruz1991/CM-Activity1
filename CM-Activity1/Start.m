//
//  ViewController.m
//  CM-Activity1
//
//  Created by Diego Alejandro Cruz Ramirez on 16/06/15.
//  Copyright (c) 2015 AdHoc. All rights reserved.
//

#import "Start.h"
#import "CustomizedCell.h"
#import "Declarations.h"
#import "CharacterDetails.h"
#import "AddNew.h"

@interface Start ()

@end

@implementation Start

/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tblMain reloadData];
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-------------------------------------------------------------------------------
-(void)initController {
    //Initialize arrays
    maNames         = [[NSMutableArray alloc] initWithObjects: @"Tyrion Lannister", @"Daenerys Targaryen", @"Arya Stark", @"Jon Snow", @"Petyr Baelish", nil];
    maAges          = [[NSMutableArray alloc] initWithObjects: @"27", @"18", @"11", @"17", @"30", nil];
    maImgs          = [[NSMutableArray alloc] initWithObjects: @"tyron.png", @"daenerys.png", @"arya.png", @"jon.png", @"petyr.png", nil];
    maDesc          = [[NSMutableArray alloc] initWithObjects:
                       @"Tyrion Lannister is the youngest son of Joanna Lannister and Lord Tywin Lannister. Tywin is the head of House Lannister, the richest man in the Seven Kingdoms and Lord Paramount of the Westerlands." ,
                       @"Daenerys is the only daughter and youngest child of King Aerys II Targaryen, the 'Mad King', and his sister-wife Rhaella. Her father died during the Sack of King's Landing, before she was even born.",
                       @"Arya Stark is the youngest daughter and third child of Lady Catelyn and Lord Eddard Stark. Eddard is the head of House Stark and Lord Paramount of the North. The North is one of the constituent regions of the Seven Kingdoms and House Stark is one of the Great Houses of the realm.",
                       @"Jon Snow is the bastard son of Eddard Stark, by a mother whose identity is a source of speculation. He was raised by his father alongside his true-born half-siblings, but joins the Night's Watch when he nears adulthood.",
                       @"Lord Petyr Baelish, sometimes called Littlefinger, serves as master of coin on King Robert I Baratheon's small council. Petyr wears a mockingbird as his personal crest instead of House Baelish's sigil, a titan's head.", nil];
}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return maNames.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Initialize cells
    CustomizedCell *cell = (CustomizedCell *)[self.tblMain dequeueReusableCellWithIdentifier:@"CustomizedCell"];
    
    if (cell == nil) {
        [self.tblMain  registerNib:[UINib nibWithNibName:@"CustomizedCell" bundle:nil] forCellReuseIdentifier:@"CustomizedCell"];
        cell = [self.tblMain  dequeueReusableCellWithIdentifier:@"CustomizedCell"];
    }
    //Fill cell with info from arrays
    cell.lblName.text   = maNames[indexPath.row];
    cell.lblAge.text    = maAges[indexPath.row];
    //Check if there are not image in the carpet and load the image from memory
    if ([UIImage imageNamed:maImgs[indexPath.row]] == nil) {
        NSString *cachedFolderPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
        NSString *cachedImagePath = [cachedFolderPath stringByAppendingPathComponent:maImgs[indexPath.row]];
        cell.imgCharacter.image = [UIImage imageWithData:[NSData dataWithContentsOfFile:cachedImagePath]];
    }else {
        cell.imgCharacter.image  = [UIImage imageNamed:maImgs[indexPath.row]];
    }
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    miCharacterIndex = (int)indexPath.row;
    CharacterDetails *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CharacterDetails"];
    
    [self presentViewController:viewController animated:YES completion:nil];
    
}

/**********************************************************************************************/
#pragma mark - Action methods
/**********************************************************************************************/
- (IBAction)btnAddNew:(id)sender {
     AddNew *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AddNew"];
    
    [self presentViewController:viewController animated:YES completion:nil];
}
@end
