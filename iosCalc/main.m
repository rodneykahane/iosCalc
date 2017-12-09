//
//  main.m
//  iosCalc
//
//  Created by Rodney Kahane on 12/3/17.
//  Copyright © 2017 Rodney Kahane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface Calculator:NSObject
-(double *) accumulator:(int) sel;
-(void) clear:(int) c;
-(void) addition:(double *) a;
-(void) subtraction:(double *) s;
-(void) multiplication:(double *) m;
-(void) division:(double *) d;
-(void) menu;
@end

@implementation Calculator

{
    //globals go here
    double retArr[2];
    int cont;
}

-(double *) accumulator:(int) sel; {
    
    double a,b;
    Calculator *mehCalc;
    mehCalc = [Calculator alloc];
    mehCalc = [mehCalc init];
    
    
    NSLog(@"enter a number:");
    scanf("%lf",&a);
    NSLog(@"enter another number:");
    scanf("%lf",&b);
    
    retArr[0]=a;
    retArr[1]=b;
    
    if(sel == 1) {
        [mehCalc addition:retArr];
    } else if (sel ==2) {
        [mehCalc subtraction:retArr];
    } else if (sel ==3) {
        [mehCalc multiplication:retArr];
    } else if (sel ==4) {
        [mehCalc division:retArr];
    }
    
    return(retArr);
    
}//end accumulator

-(void) clear:(int) c; {
    
    
    
}//end clear
-(void) addition:(double *) a; {
    
    double resultAdd;
    
    //NSLog(@"we're in addition, retArr[0] is %lf and retArr[1] is %lf",a[0],a[1]);
    resultAdd = a[0]+a[1];
    NSLog(@"%lf + %lf is %lf",a[0],a[1],resultAdd);
    
}//end addition
-(void) subtraction:(double *) s; {
    
    double resultSub;
    
    // NSLog(@"we're in sub, retArr[0] is %lf and retArr[1] is %lf",s[0],s[1]);
    resultSub = s[0]-s[1];
    NSLog(@"%lf - %lf is %lf",s[0],s[1],resultSub);
}//end subtraction
-(void) multiplication:(double *) m; {
    
    double resultMul;
    
    // NSLog(@"we're in mult, retArr[0] is %lf and retArr[1] is %lf",m[0],m[1]);
    resultMul = m[0]*m[1];
    NSLog(@"%lf * %lf is %lf",m[0],m[1],resultMul);
}//end multiplication
-(void) division:(double *) d; {
    
    double resultDiv;
    
    // NSLog(@"we're in div, retArr[0] is %lf and retArr[1] is %lf",d[0],d[1]);
    resultDiv = d[0]/d[1];
    NSLog(@"%lf / %lf is %lf",d[0],d[1],resultDiv);
}//end division

-(void) menu {
    
    
    Calculator *blahCalc;
    blahCalc = [Calculator alloc];
    blahCalc = [blahCalc init];
    
    while(cont !=9){
        NSLog(@"press 1 for addition, press 2 for sub, press 3 for mult, press 4 for div");
        NSLog(@"press 9 for exit");
        scanf("%i",&cont);
        if(cont ==1){
            [blahCalc accumulator:cont];
        } else if (cont == 2) {
            [blahCalc accumulator:cont];
        } else if (cont == 3 ) {
            [blahCalc accumulator:cont];
        } else if ( cont == 4) {
            [blahCalc accumulator:cont];
        }
    }//end while
    
    exit(0);
    
    
    
}//end menu


@end


int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        //setting up calculator class
        Calculator *myCalc;
        myCalc = [Calculator alloc];
        myCalc = [myCalc init];
        
        [myCalc menu];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
