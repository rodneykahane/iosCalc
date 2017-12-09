//
//  ViewController.m
//  iosCalc
//
//  Created by Rodney Kahane on 12/3/17.
//  Copyright © 2017 Rodney Kahane. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()

@end

@implementation ViewController
{
    char op;
    int currentNumber;
    BOOL firstOperand, isNumerator;
    Calculator *myCalculator;
    
    NSMutableString *displayString;
}//end globals




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc]init];
}//end viewDidLoad

-(void) processDigit: (int) digit {

    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:[NSString stringWithFormat:@"%i",digit]];
    _display.text=displayString;
    
}//end processDigit

-(IBAction) clickDigit:(UIButton *)sender {
    
    int digit = sender.tag;
    
    [self processDigit:digit];
    
}//end clickDigit

-(void) processOp:(char)theOp {
    
    NSString *opStr;
    
    op = theOp;
    
    switch(theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
    }//end switch
    
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;
    
    [displayString appendString: opStr];
    _display.text = displayString;
    
}//end processOp

-(void) storeFracPart {
    
    if (firstOperand) {
        if(isNumerator) {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;  //eg 3* 4/5 =
        }//end isNumerator
        else
            myCalculator.operand1.denominator = currentNumber;
    }//end if firstOperand
    else if (isNumerator) {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1; // eg 3/2 * 4 =
    }//end else if
    else {
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }//end else
    
    currentNumber = 0;
    
}//end storeFracPart

-(IBAction)clickOver {
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString: @"/"];
    _display.text = displayString;
}//end clickOver

-(IBAction)clickPlus {
    
    [self processOp: '+'];
    
}//end clickPlus

-(IBAction)clickMinus {
    
    [self processOp:'-'];
    
}//end clickMinus

-(IBAction)clickMultiply {
    
    [self processOp:'*'];
    
}//end clickMultiply

-(IBAction)clickDivide {
    
    [self processOp:'/'];
    
}//end clickDivide

//Misc. keys

-(IBAction)clickEquals {
    
    if (firstOperand == NO) {
        [self storeFracPart];
        [myCalculator performOperation:op];
        
        [displayString appendString: @" = "];
        [displayString appendString:[myCalculator.accumulator convertToString]];
        _display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand = YES;
        [displayString setString:@""];
    }
    
}//end clickEquals

-(IBAction)clickClear {
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString:@""];
    _display.text = displayString;
    
    isNumerator = YES;
    
    
}//end clickClear

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}//end didReceiveMemoryWarning


@end
