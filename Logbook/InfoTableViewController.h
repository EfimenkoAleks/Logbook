//
//  InfoTableViewController.h
//  Logbook
//
//  Created by mac on 26.04.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *option1Label;
@property (weak, nonatomic) IBOutlet UILabel *option2Label;
@property (weak, nonatomic) IBOutlet UILabel *option3Label;
@property (weak, nonatomic) IBOutlet UILabel *option4Label;
@property (weak, nonatomic) IBOutlet UILabel *option5Label;
@property (weak, nonatomic) IBOutlet UIImageView *option1Image;
@property (weak, nonatomic) IBOutlet UIImageView *option2Image;
@property (weak, nonatomic) IBOutlet UIImageView *option3Image;
@property (weak, nonatomic) IBOutlet UIImageView *option4Image;
@property (weak, nonatomic) IBOutlet UIImageView *option5Image;

@property (nonatomic) NSArray *option,*images;

@end
