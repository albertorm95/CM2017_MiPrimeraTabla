//
//  ViewController.m
//  Mi Primera Tabla
//
//  Created by Walter Gonzalez Domenzain on 20/09/17.
//  Copyright © 2017 wgdomenzain. All rights reserved.
//

#import "Home.h"
#import "cellMainTable.h"

@interface Home ()
@property NSMutableArray *chartersNames;
@property NSMutableArray *charterCountry;
@property NSMutableArray *charterImages;
@end

@implementation Home
/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initController];
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-------------------------------------------------------------------------------
- (void)initController {
    self.chartersNames  = [[NSMutableArray alloc] initWithObjects: @"Ana", @"D.Va", @"Hanzo", @"Genji", nil];
    
    self.charterCountry  = [[NSMutableArray alloc] initWithObjects: @"Egypt", @"South Korea", @"Japan", @"Japan", nil];

    self.charterImages = [[NSMutableArray alloc] initWithObjects: @"Ana_portrait.png", @"Dva_portrait.png", @"Hanzo_portrait.png", @"Genji_portrait.png", nil];
}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.chartersNames.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellMainTable *cell = (cellMainTable *)[tableView dequeueReusableCellWithIdentifier:@"cellMainTable"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellMainTable" bundle:nil] forCellReuseIdentifier:@"cellMainTable"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellMainTable"];
    }
    //Fill cell with info from arrays
    cell.lblName.text       = self.chartersNames[indexPath.row];
    cell.lblCountry.text        = self.charterCountry[indexPath.row];
    cell.imgUser.image      = [UIImage imageNamed:self.charterImages[indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //Pending
}
/**********************************************************************************************/
#pragma mark - Action methods
/**********************************************************************************************/
- (IBAction)btnAddPressed:(id)sender {
    self.alertView = [UIAlertController alertControllerWithTitle: @"Add new Charter"
                                                         message: @"Input name and country"
                                                  preferredStyle:UIAlertControllerStyleAlert];
    [self.alertView addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Name";
        textField.textColor = [UIColor blueColor];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.borderStyle = UITextBorderStyleRoundedRect;
    }];
    [self.alertView addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Country";
        textField.textColor = [UIColor blueColor];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.borderStyle = UITextBorderStyleRoundedRect;
    }];
    [self.alertView addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSArray * textfields = self.alertView.textFields;
            UITextField * namefield = textfields[0];
            UITextField * countryfield = textfields[1];
            [self.chartersNames addObject:namefield.text];
            [self.charterCountry addObject:countryfield.text];
            [self.charterImages addObject:@"Ana_portrait.png"];
            [self.tblMain reloadData];
        }
    ]];
    [self presentViewController:self.alertView animated:YES completion:nil];

}


@end
