//
//  DetailInfoCarViewController.m
//  Logbook
//
//  Created by mac on 08.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import "DetailInfoCarViewController.h"

@interface DetailInfoCarViewController ()

@end

@implementation DetailInfoCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* text=self.infoCar.descriptionInfoCar;
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0,0,340,220)];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:((void)(@" %@"),text)];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = [UIImage imageNamed:self.infoCar.imageInfo];
    
    CGFloat oldWidth = textAttachment.image.size.width;
    
    //I'm subtracting 10px to make the image display nicely, accounting
    //for the padding inside the textView
    CGFloat scaleFactor = oldWidth / (textView.frame.size.width - 10);
    textAttachment.image = [UIImage imageWithCGImage:textAttachment.image.CGImage scale:scaleFactor orientation:UIImageOrientationUp];
    NSAttributedString *attrStringWithImage = [NSAttributedString attributedStringWithAttachment:textAttachment];
    [attributedString replaceCharactersInRange:NSMakeRange(0, 1) withAttributedString:attrStringWithImage];
        
    self.detailInfoCarTextView.attributedText=attributedString;
    
    UIColor *color=[UIColor colorWithRed:0.4 green:0.8 blue:0.1 alpha:1];
    self.view.backgroundColor=color;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
