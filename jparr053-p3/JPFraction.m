//
//  JPFraction.m
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


#import "JPFraction.h"

@implementation JPFraction


// Synthesize for numerator and denominator so they can be used.
@synthesize numerator, denominator;


// setTo method accepts two ints and assigns them to numerator and denominator
-(void) setTo:(int)n over:(int)d
{
    numerator = n;
    denominator = d;
}

// print method prints the numerator and denominator as a fraction to the console
-(void)print
{
    NSLog(@"%i/%i", numerator, denominator);
}


// convertToNum changes a fraction to decimal format. It returns a double
-(double)convertToNum
{
    // If the denominator IS NOT 0, then cast the numerator as a double and divide it by the denominator and return that value. Otherwise return NAN.
    if(denominator !=0)
    {
        return (double)numerator/denominator;
    }
    
    else
    {
        return NAN;
    }
}



// convertToString changes a numerator or a numerator/denominator combo into string format.
-(NSString *)convertToString
{
    
    // Test to see if the numerator is equal to the denominator.
    if(numerator == denominator)
    {
        
        // If so, then test if the numerator is 0.
        if(numerator == 0)
            
            // If that is also true, then return String "0".
            return @"0";
    
        // Otherwise return string "1".
        else
        {
            return @"1";
        }
    }
    
    // Else if the denominator is equal to 1, return the numerator in string format.
    else if(denominator == 1)
    {
        return [NSString stringWithFormat: @"%i", numerator];
    }
    
    // Otherwise return the numerator and denominator as a fraction in string format.
    else
    {
        return [NSString stringWithFormat: @"%i/%i",numerator,denominator];
    }
}


// Method to add fractions. It accepts a JPFraction, and returns a JPFraction

-(JPFraction *) add:(JPFraction *) f
{
    // Create a JPFraction named result
    JPFraction *result = [[JPFraction alloc]init];
    
    // Set the numerator and denominator of our JPFraction Result using the rules for adding fractions
    result.numerator = numerator * f.denominator + denominator *f.numerator;
    
    result.denominator = denominator * f.denominator;
    
    // Reduce the result fraction
    [result reduce];
    
    // Return the result fraction
    return result;
}


// Method to subtract fractions. It accepts a JPFraction, and returns a JPFraction

-(JPFraction *) subtract:(JPFraction *) f
{
    // Create a JPFraction named result
    JPFraction *result = [[JPFraction alloc]init];
    
    // Set the numerator and denominator of our JPFraction Result using the rules for subtracting fractions    
    result.numerator = numerator * f.denominator - denominator *f.numerator;
    
    result.denominator = denominator * f.denominator;
    
    // Reduce the result fraction    
    [result reduce];
    
    // Return the result fraction    
    return result;
}


// Method to multiply fractions. It accepts a JPFraction, and returns a JPFraction

-(JPFraction *) multiply:(JPFraction *) f
{
    // Create a JPFraction named result    
    JPFraction *result = [[JPFraction alloc]init];
    
    // Set the numerator and denominator of our JPFraction Result using the rules for multiplying fractions    
    result.numerator = numerator * f.numerator;
    
    result.denominator = denominator * f.denominator;
    
    // Reduce the result fraction    
    [result reduce];
    
    // Return the result fraction    
    return result;
}


// Method to divide fractions. It accepts a JPFraction, and returns a JPFraction

-(JPFraction *) divide:(JPFraction *) f
{
    // Create a JPFraction named result    
    JPFraction *result = [[JPFraction alloc]init];
    
    // Set the numerator and denominator of our JPFraction Result using the rules for dividing fractions    
    result.numerator = numerator * f.denominator;
    
    result.denominator = denominator * f.numerator;
    
    // Reduce the result fraction    
    [result reduce];
    
    // Return the result fraction    
    return result;
}


// reduce method simplifies a fraction.

-(void)reduce
{
    // Create three ints. One is used for the numerator and the other for the denominator. The third is used as a temp value.
    int u = numerator;
    int v = denominator;
    int temp;
    
    // If u is 0 just return and do nothing.
    if(u == 0)
    {
        return;
    }
    
    // Else check to see if u is less than 0.
    else if (u < 0)
    {
        // If it is , then u is equal to negative u.
        u = -u;
    }
    
    // Start a while loop that continues so long as v is NOT 0.
    while(v !=0)
    {
        // temp is equal to u modulus v.
        temp = u % v;
        
        // v is now assigned to u
        u = v;
        
        // temp is then assigned to v
        v = temp;
        
        //repeat this loop until  v is 0.
    }
    
    // Divide the numerator by u and assign the result back to numerator.
    numerator /=u;
    
    // Divide denominator by u and assign the result back to denominator.
    denominator /=u;
}

@end
