//
//  JPCalculator.m
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



#import "JPCalculator.h"

// #import JPFraction.h here
#import "JPFraction.h"

@implementation JPCalculator

// Synthesize operand1, operand2, and the accumulator so we can use them here.
@synthesize operand1, operand2, accumulator;


// Override the init method
-(id)init
{
    self = [super init];
    
    if(self)
    {
        // Allocate and Initiate operand1, operand2, and accumulator
        
        operand1 = [[JPFraction alloc]init];
        operand2 = [[JPFraction alloc]init];
        accumulator = [[JPFraction alloc]init];
    }
    
    return self;
}


// clear method clears the values for the numerator and denominator for the accumulator.

-(void) clear
{
    // accumulator's numerator is set to 0.
    accumulator.numerator = 0;
    
    // accumulator's denominator is set to 0.
    accumulator.denominator = 0;
}

// performOperation accepts a char and returns a JPFraction

-(JPFraction *) performOperation:(char)op
{
    // Create a JPFraction named result
    JPFraction *result;
    
    // User a switch to test the char "op"
    switch(op)
    {
            // If it is a +, add the two operands.
            case '+':
            result = [operand1 add:operand2];
            break;
            
            
            // If it is a -, subtract operand2 from operand1
            case '-':
            result = [operand1 subtract: operand2];
            break;
            
            
            // If it is a *, multiple operand1 by operand2
            case '*':
            result = [operand1 multiply:operand2];
            break;
            
            
            // If it is a /, divide operand1 by operand2
            case '/':
            result = [operand1 divide: operand2];
            break;
    }
    
    
    // Assign the accumulator's numerator to result's numerator
    accumulator.numerator = result.numerator;
    
    // Assign the accumulator's denominator to result's denominator
    accumulator.denominator = result.denominator;
    
    
    // Return the accumulator
    return accumulator;
}

@end
