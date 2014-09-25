//
//  JPFraction.h
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

@interface JPFraction : NSObject

// Property for both numerator and denominator
@property int numerator, denominator;

// print method
-(void)print;

// setTo Method for fractions
-(void)setTo:(int)n over:(int)d;

// reduce methods reduces fractions
-(void)reduce;

// Methods to add, subtract, multiply, and divide the fractions
-(JPFraction *)add:(JPFraction *)f;
-(JPFraction *)subtract:(JPFraction *)f;
-(JPFraction *)multiply:(JPFraction *)f;
-(JPFraction *)divide:(JPFraction *)f;

// convertToNum converts a fraction to decimal format.
-(double)convertToNum;

// convertToString converts a fraction to a string format
-(NSString *)convertToString;

@end
