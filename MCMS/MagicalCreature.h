//
//  MagicalCreature.h
//  MCMS
//
//  Created by Orten, Thomas on 20.05.14.
//  Copyright (c) 2014 Orten, Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject
@property NSString *name;
@property NSString *description;
@property UIImage *image;
- (MagicalCreature *)initWithName:(NSString *)name;
- (MagicalCreature *)initWithName:(NSString *)name description:(NSString *)description;
- (MagicalCreature *)initWithName:(NSString *)name description:(NSString *)description image:(UIImage *)image;
@end
