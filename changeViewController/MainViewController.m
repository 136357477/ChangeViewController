//
//  MainViewController.m
//  changeViewController
//
//  Created by guohui on 15/7/3.
//  Copyright (c) 2015年 guohui. All rights reserved.
//

#import "MainViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface MainViewController ()
{
    UIViewController *currentViewController;
}
@end

@implementation MainViewController

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    FirstViewController *firstViewController = [[FirstViewController alloc]initWithNibName:@"FirstViewController" bundle:nil];
    [self addChildViewController:firstViewController];
    
    SecondViewController *secondViewController = [[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
    [self addChildViewController:secondViewController];
    
    ThirdViewController *thirdViewController = [[ThirdViewController alloc]initWithNibName:@"ThirdViewController" bundle:nil];
    [self addChildViewController:thirdViewController];
    
    [_contentView addSubview:thirdViewController.view];
    
    currentViewController = thirdViewController ;

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)onClickbutton:(UIButton *)sender {
    FirstViewController *firstViewController=[self.childViewControllers objectAtIndex:0];
    ThirdViewController *thirdViewController=[self.childViewControllers objectAtIndex:2];
    SecondViewController *secondViewController=[self.childViewControllers objectAtIndex:1];
    if ((currentViewController==firstViewController&&[sender tag]==1)||(currentViewController==secondViewController&&[sender tag]==2) ||(currentViewController==thirdViewController&&[sender tag]==3) ) {
        return;
    }
    UIViewController *oldViewController=currentViewController;
    switch ([sender tag]) {
        case 1:
        {
            NSLog(@"留言及回复");
            //这是一个替换函数  将firstViewControll 替换 之前的  currentViewController
            [self transitionFromViewController:currentViewController toViewController:firstViewController duration:4 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            }  completion:^(BOOL finished) {
                if (finished) {
                    currentViewController=firstViewController;
                }else{
                    currentViewController=oldViewController;
                }
            }];
        }
            break;
        case 2:
        {
            NSLog(@"生日提醒");
            [self transitionFromViewController:currentViewController toViewController:secondViewController duration:1 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
                
            }  completion:^(BOOL finished) {
                if (finished) {
                    currentViewController=secondViewController;
                }else{
                    currentViewController=oldViewController;
                }
            }];
        }
            break;
        case 3:
        {
            NSLog(@"好友申请");
            [self transitionFromViewController:currentViewController toViewController:thirdViewController duration:1 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
                
            }  completion:^(BOOL finished) {
                if (finished) {
                    currentViewController=thirdViewController;
                }else{
                    currentViewController=oldViewController;
                }
            }];
        }
            break;
        default:
            break;
    }
    
}
@end
