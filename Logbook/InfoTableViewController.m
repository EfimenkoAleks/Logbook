//
//  InfoTableViewController.m
//  Logbook
//
//  Created by mac on 26.04.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import "InfoTableViewController.h"

@interface InfoTableViewController ()

@end

@implementation InfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *color=[UIColor grayColor];
    self.view.backgroundColor=color;
    
    self.option=@[@"Заправка автомобиля",@"Расходные материалы",@"Ремонт",@"Расходы",@"Информация"];
    self.images=@[@"icons8-бар-100",@"icons8-настройки-100",@"icons8-настройки-100",@"icons8-бухгалтерский-учет-100",@"icons8-новости-100"];
    
    self.option1Label.text=self.option[0];
    UIImage *image1=[UIImage imageNamed:self.images[0]];
    self.option1Image.image=image1;
    self.option2Label.text=self.option[1];
    UIImage *image2=[UIImage imageNamed:self.images[1]];
    self.option2Image.image=image2;
    self.option3Label.text=self.option[2];
    UIImage *image3=[UIImage imageNamed:self.images[2]];
    self.option3Image.image=image3;
    self.option4Label.text=self.option[3];
    UIImage *image4=[UIImage imageNamed:self.images[3]];
    self.option4Image.image=image4;
    self.option5Label.text=self.option[4];
    UIImage *image5=[UIImage imageNamed:self.images[4]];
    self.option5Image.image=image5;
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
