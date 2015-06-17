//
//  AddNew.m
//  CM-Activity1
//
//  Created by Diego Alejandro Cruz Ramirez on 17/06/15.
//  Copyright (c) 2015 AdHoc. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "AddNew.h"
#import "Declarations.h"

UIImagePickerController *imgPicker;

@interface AddNew ()

@end

@implementation AddNew

/**********************************************************************************************/
#pragma mark - Init Methods
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController {
    [[self.txtViewDesc layer] setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [[self.txtViewDesc layer] setBorderWidth:1];
    [[self.txtViewDesc layer] setCornerRadius:5];
    self.txtViewDesc.clipsToBounds = YES;
}

/**********************************************************************************************/
#pragma mark - Delegate methods
/**********************************************************************************************/
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editInfo {
    // Asignamos la imagen al Image View o realizamos las operaciones que necesitemos
    self.imgAddImg.image = img;
    // Descargamos la ventana modal
    [self dismissModalViewControllerAnimated:YES];
}

/**********************************************************************************************/
#pragma mark - Action button methods
/**********************************************************************************************/
- (IBAction)btnAdd:(id)sender {
    [maAges  addObject:  self.txtAge.text];
    [maNames addObject:  self.txtName.text];
    [maDesc  addObject:  self.txtViewDesc.text];
    
    NSString *imgName = [self.txtName.text stringByAppendingString:@".png"];
    
    [imgName stringByReplacingOccurrencesOfString: @" " withString: @"_"];
    [maImgs addObject: imgName];
    
    UIImage *image = self.imgAddImg.image;
    NSString *cachedFolderPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *cachedImagePath = [cachedFolderPath stringByAppendingPathComponent:imgName];
    [UIImagePNGRepresentation(image) writeToFile:cachedImagePath atomically:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnAddNewImg:(id)sender {
    // Preparamos el image picker
    imgPicker = [[UIImagePickerController alloc] init];
    [imgPicker setDelegate:self];
    
    // Establecemos el origen de la imagen (carrete)
    // Si queremos tomar una nueva imagen el valor será UIImagePickerControllerSourceTypeCamera
    [imgPicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    // Mostramos el control modal
    [self presentViewController:imgPicker animated:YES completion:nil];
    
}

- (IBAction)btnCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
