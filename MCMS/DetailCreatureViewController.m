//
//  DetailCreatureViewController.m
//  MCMS
//
//  Created by Orten, Thomas on 20.05.14.
//  Copyright (c) 2014 Orten, Thomas. All rights reserved.
//

#import "ViewController.h"
#import "DetailCreatureViewController.h"

@interface DetailCreatureViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImageView;
@end

@implementation DetailCreatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nameTextField.text = self.creature.name;
    self.descriptionLabel.text = self.creature.description;
    NSLog(@"%@", self.creature);
    self.creatureImageView.image = self.creature.image;
}

- (IBAction)onEditButtonPress:(UIButton *)sender {
    self.editing = !self.editing;
    if (self.editing) {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
    } else {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        if (![self.creature.name isEqualToString:self.nameTextField.text]) {
            self.creature.name = self.nameTextField.text;
            [self.nameTextField resignFirstResponder];
        }
    }
}

@end
