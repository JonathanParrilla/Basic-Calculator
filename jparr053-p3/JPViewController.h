//
//  JPViewController.h
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

#import <UIKit/UIKit.h>

@interface JPViewController : UIViewController

// Property for the display

@property (strong, nonatomic) IBOutlet UILabel *display;



// The methods for manipulating values of keys and operators

-(void) processDigit:(int)digit;
-(void) processOp:(char)theOp;
-(void) storeFractPart;



// Method that processes what to do when a digit is pressed.

-(IBAction) clickDigit:(UIButton*)sender;



// Methods that process how to handle when operator keys are pressed

-(IBAction) clickPlus;
-(IBAction) clickMinus;
-(IBAction) clickMultiply;
-(IBAction) clickDivide;



// Methods that process how to handle the technical buttons like Over, Clear, Convert, etc

-(IBAction) clickOver;
-(IBAction) clickEquals;
-(IBAction) clickClear;
-(IBAction) clickConvert;



@end
