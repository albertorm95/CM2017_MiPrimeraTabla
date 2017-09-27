//
//  ViewController.h
//  Mi Primera Tabla
//
//  Created by Walter Gonzalez Domenzain on 20/09/17.
//  Copyright © 2017 wgdomenzain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tblMain;
- (IBAction)btnAddPressed:(id)sender;

@property (strong, nonatomic) UIAlertController *alertView;

// Name and Country Inputs
@property (strong, nonatomic) IBOutlet UITextField *nameInput;
@property (strong, nonatomic) IBOutlet UITextField *countryInput;

// Gallery and Picture buttons
@property (strong, nonatomic) IBOutlet UIButton *fromGalleryBtn;
@property (strong, nonatomic) IBOutlet UIButton *fromCameraBtn;

// Create and Cancel
@property (strong, nonatomic) IBOutlet UIButton *createBtn;
@property (strong, nonatomic) IBOutlet UIButton *cancelBtn;

@property (strong, nonatomic) IBOutlet UIView *NewCharterView;

@end

