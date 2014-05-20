//
//  MagicalCreature.m
//  MCMS
//
//  Created by Orten, Thomas on 20.05.14.
//  Copyright (c) 2014 Orten, Thomas. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

- (MagicalCreature *)initWithName:(NSString *)name
{
    self.name = name;
    return self;
}

- (MagicalCreature *)initWithName:(NSString *)name description:(NSString *)description
{
    self.name = name;
    self.description = description;
    return self;
}

- (MagicalCreature *)initWithName:(NSString *)name description:(NSString *)description image:(UIImage *)image
{
    self.name = name;
    self.description = description;
    self.image = image;
    return self;
}

@end
