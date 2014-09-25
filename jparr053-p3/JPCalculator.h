//
//  JPCalculator.h
//  jparr053-p3
//
//  Created by Jonathan Parrilla on 1/30/14.
//  Copyright (c) 2014 Jonathan Parrilla. All rights reserved.
//

/*
 
 PROGRAMMER: Jonathan Parrilla
 
 PANTHER ID: 3767284
 
 CLASS: COP 4655 MW 5:00 PM
 
 INSTRUCTOR: Steven Luis
 
 ASSIGNMENT: Program 3 - Calculator (Jparr053-p3)
 
 DUE: Wednesday 2/5/2014
 
 */



#import <Foundation/Foundation.h>

// User the forward declaration @class rather than #import for JPFraction
//#import "JPFraction.h"
@class JPFraction;

@interface JPCalculator : NSObject


// Property for operand1, operand2, and the accumulator, which are all JPFraction instances
@property (strong, nonatomic) JPFraction *operand1, *operand2, *accumulator;

// performOperation method accepts a char, and returns a JPFraction
-(JPFraction *) performOperation:(char)op;

// This method will clear the calculator
-(void) clear;


@end
