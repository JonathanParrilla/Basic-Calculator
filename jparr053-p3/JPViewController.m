//
//  JPViewController.m
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

#import "JPViewController.h"

// Import both the JPCalculator and JPFraction class header files.
#import "JPCalculator.h"
#import "JPFraction.h"


@implementation JPViewController
{
    // Create the variables we will need
    
    //  A char for the operator
    char op;
    
    // An int for the current number pressed
    int currentNumber;
    
    // A Boolean to determine if it is the first operand and/ numerator
    BOOL firstOperand, isNumerator;
    
    // Instantiate our calculator
    JPCalculator *myCalculator;
    
    // An NSMutableString to hold what we will display to the user.
    NSMutableString *displayString;
}

@synthesize display;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // These are the initial values and default settings
    
    // The first digit pressed is the first operand
    firstOperand = YES;
    
    // The first digit is a numerator
    isNumerator = YES;
    
    //The displayString has a capacity of 40 characters
    displayString = [NSMutableString stringWithCapacity:40];
    
    // Allocate space for the Calculator and initiate it
    myCalculator = [[JPCalculator alloc]init];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// processDigit takes the number or digit that's pressed and assigns it to the current number and then displays it

-(void)processDigit:(int)digit
{
    // Take the current statrting number(0), multiply it by 10, add the value of the pressed digit to it, and assign it back to current number.
    currentNumber = currentNumber * 10 + digit;
    
    // Append the digit to the displayString and display it to the user.
    [displayString appendString:[NSString stringWithFormat: @"%i",digit]];
    
    // Display the digit to the user/view
    display.text = displayString;
}


// processOp takes the operator char and tests it to see if either  +, -, *, or / was pressed, displays it to the user via the display as well storing both the first number and operator.
-(void) processOp:(char)theOp
{
    // Create an NSString named opStr
    NSString *opStr;
    
    // Assign theOp, which is our value received, to our global operator value 'op'.
    op = theOp;
    
    // User a switch case to test theOp. Depending on what it is, we assign that char to opStr.
    switch(theOp)
    {
            case '+':
            opStr = @" + ";
            break;
            
            case '-':
            opStr = @" - ";
            break;
            
            case '*':
            opStr = @" X ";
            break;
            
            case '/':
            opStr = @" / ";
            break;
    }
    
    // Call the storeFractPart method
    [self storeFractPart];
    
    // Since we have our first operand, the firstOperand setting is changed to NO
    firstOperand = NO;
    
    // isNumerator is still left as YES
    isNumerator = YES;
    
    // Append the operator pressed to the displayString
    [displayString appendString:opStr];
    
    // Display the updated string to the user/view
    display.text = displayString;

}


// storeFractPart method stores the current values for our operands and operator and assigns them to our models. This is how our calculator remembers what was pressed after each button press.
-(void) storeFractPart
{
    // It tests to see if the first Operand exists.
    if(firstOperand)
    {
        // If it does it then tests to see if it is a numerator. So if isNumereator is NO, then this is false.
        if(isNumerator)
        {
            // If it is is assigns the current number pressed to the operand1 numerator value to the model
            myCalculator.operand1.numerator = currentNumber;
            
            // It sets the operand1 denominator to 1 since any number divided by 1 is itself. This is also done because we NEED to have both a numerator and a denominator.
            myCalculator.operand1.denominator = 1;
        }
        
        else
        {
            // If it is the firstOperand but not a numerator, then it is a denominator for operand1 and thus it sets the current number to operand1 denominator
            myCalculator.operand1.denominator = currentNumber;
        }
    }
    
    // If it is not the first operand, it is the second one by default and thus tests to see if it is a numerator. Why? because our second operand could be a fraction, not just a whole number.
    else if(isNumerator)
    {
        // If it is the numerator (as in numerator is set to YES) then assign our current number to operand2 numerator.
        myCalculator.operand2.numerator = currentNumber;
        
        // Once again, set the operand2 denominator to 1 since any number divided by 1 is itself.
        myCalculator.operand2.denominator = 1;
    }
    
    // If it is not a numerator, then it is a demonimator by default
    else
    {
        // If this is the case, se the operand2 demonimator to whatever the current number is.
        myCalculator.operand2.denominator = currentNumber;
        
        // we then reset the firstOperand bool/setting back to YES. Why? Because our calculator can only handle two operands interacting with one another, so 2 + 2 is feasible, but 3 + 3 + 7 is not.
        firstOperand = YES;
    }
    
    // At the end of the method, reset the current Number to 0.
    currentNumber = 0;
}



// clickDigit is an action response that occurs when ANY of our digit buttons are pressed

-(IBAction) clickDigit:(UIButton*)sender
{
    // Create and int named digit and assign to it the button's tag, which should correspond to its mathematical value. So the button labled "7" has an id of 7.
    int digit = sender.tag;
    
    // Call the processDigit method and pass it the digit.
    [self processDigit:digit];
}



//Arithmetic Operations Methods

// When the plus button is pressed, it calls the processOp method and sends it a '+' char

-(IBAction) clickPlus
{
    [self processOp: '+'];
}

// When the minus button is pressed, it calls the processOp method and sends it a '-' char

-(IBAction) clickMinus
{
    [self processOp: '-'];
}

// When the multiply button is pressed, it calls the processOp method and sends it a '*' char

-(IBAction) clickMultiply
{
    [self processOp: '*'];
}

// When the divide button is pressed, it calls the processOp method and sends it a '/' char

-(IBAction) clickDivide
{
    [self processOp: '/'];
}



//Technical operation button methods

// Actions to be taken when Over button is pressed

-(IBAction) clickOver
{
    // Call the storeFractPart method to store the numerator in the first operand
    [self storeFractPart];
    
    // Set isNumerator to NO
    isNumerator = NO;
    
    // Append the '/' char to the displayString
    [displayString appendString: @"/"];
    
    // Display the updated string to the user/view.
    display.text = displayString;
}

//Actions to be taken when the equals button is pressed.

-(IBAction) clickEquals
{
    // Check to see if it is the first operand. If it is, do nothing. If it is not, then do the following:
    if(firstOperand == NO)
    {
        // call the storeFractPart method to update our operands
        [self storeFractPart];
        
        // Call the performOpertaion method from the calculator model and send it the operator character that was assigned to it.
        [myCalculator performOperation: op];
        
        // Append '=' to the displayString
        [displayString appendString: @" = "];
        
        // Get the accumulated value and convert the result to a string using the convertToString Method
        [displayString appendString: [myCalculator.accumulator convertToString]];
        
        // Display the updated displayString with our result to the user/view.
        display.text = displayString;
        
        // Reset the current number to 0.
        currentNumber = 0;
        
        // Set the isNumerator bool/setting to YES
        isNumerator = YES;
        
        // Set the firstOperand bool/setting to YES
        firstOperand = YES;
        
        // Set the displayString to nothing or ""
        [displayString setString: @""];
    }
}


// Action to be taken when the Clear button is pressed

-(IBAction) clickClear
{
    
    // Set isNumerator bool/setting to YES
    isNumerator = YES;
    
    // Set firstOperand bool/setting to YES
    firstOperand = YES;
    
    // Set currentNumber to 0
    currentNumber = 0;
    
    // Call the clear method from our calculator model
    [myCalculator clear];
    
    
    // Set the displayString to ""
    [displayString setString: @""];
    
    // Set the user/view display to blank
    display.text = displayString;
}

// Action to be taken when the Convert button is pressed

-(IBAction) clickConvert
{
    // Call the storeFractPart method
    [self storeFractPart];
    
    // Set isNumerator bool/setting to YES
    isNumerator = YES;
    
    
    // Append the '=' sign to the displayString
    [displayString appendString: @" = "];
    
    // Convert operand1 to a double by calling the convertToNum method and assign it to the created double variable named convertedFraction
    double convertedFraction = [myCalculator.operand1 convertToNum];
    
    // Convert the convertFraction to a string and append the convertedFraction to the displayString
    [displayString appendString:[NSString stringWithFormat:@"%f",convertedFraction]];
    
    // Display the updated displayString to the user/view
    display.text = displayString;
    
    // Reset the current number to 0.
    currentNumber = 0;
    
    // Set the isNumerator bool/setting to YES
    isNumerator = YES;
    
    // Set the firstOperand bool/setting to YES
    firstOperand = YES;
    
    // Set the displayString to nothing or ""
    [displayString setString: @""];
    
    
}


@end
