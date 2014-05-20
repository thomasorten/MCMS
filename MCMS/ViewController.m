//
//  ViewController.m
//  MCMS
//
//  Created by Orten, Thomas on 20.05.14.
//  Copyright (c) 2014 Orten, Thomas. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "DetailCreatureViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *onAddCreatureTextField;
@property (weak, nonatomic) IBOutlet UITableView *creatureTableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    MagicalCreature *creature1 = [[MagicalCreature alloc] initWithName:@"A giant snake" description:@"It's the size of an SUV" image:[UIImage imageNamed:@"giant_snake"]];
    MagicalCreature *creature2 = [[MagicalCreature alloc] initWithName:@"A purple lizard" description:@"It gets it color by eating beets" image:[UIImage imageNamed:@"purple_lizard"]];
    MagicalCreature *creature3 = [[MagicalCreature alloc] initWithName:@"A featherless bird" description:@"It flies so fast it loses its feathers in flight" image:[UIImage imageNamed:@"featherless_bird"]];

	self.creatures = [NSMutableArray arrayWithObjects:
                      creature1,
                      creature2,
                      creature3, nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreatureCellID"];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.description;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    cell.imageView.image = creature.image;
    return cell;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.creatureTableView reloadData];
}

- (IBAction)onAddCreatureButton:(id)sender
{
    NSString *inputString = self.onAddCreatureTextField.text;
    NSString *trimmedString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (![inputString isEqualToString:@""]) {
        MagicalCreature *newCreature = [[MagicalCreature alloc] initWithName:trimmedString];
        [self.creatures addObject:newCreature];
        [self.creatureTableView reloadData];
        self.onAddCreatureTextField.text = nil;
        [self.onAddCreatureTextField resignFirstResponder];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailCreatureViewController *detailViewController = segue.destinationViewController;
    NSIndexPath *indexPath = self.creatureTableView.indexPathForSelectedRow;
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    detailViewController.creature = creature;
}

@end
