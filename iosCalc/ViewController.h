//
//  ViewController.h
//  iosCalc
//
//  Created by Rodney Kahane on 12/3/17.
//  Copyright © 2017 Rodney Kahane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *display;

-(void) processDigit: (int) digit;
-(void) processOp: (char) theOp;
-(void) storeFracPart;

//numberic keys

-(IBAction)clickDigit: (UIButton *) sender;

//arithmetic operation keys

-(IBAction)clickPlus;
-(IBAction)clickMinus;
-(IBAction)clickMultiply;
-(IBAction)clickDivide;

//misc keys

-(IBAction)clickOver;
-(IBAction)clickEquals;
-(IBAction)clickClear;

@end

