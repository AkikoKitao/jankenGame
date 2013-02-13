//
//  ViewController.h
//  janken
//
//  Created by Kitao Akiko on 13/02/09.
//  Copyright (c) 2013年 Kitao Akiko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UIButton *btn_gu;
    IBOutlet UIButton *btn_tyoki;
    IBOutlet UIButton *btn_pa;
    IBOutlet UIButton *btn_again;
    IBOutlet UILabel  *lbl_mes;
    IBOutlet UILabel  *lbl_kekka;
    IBOutlet UILabel  *lbl_aite;
    IBOutlet UIImageView *aite_img;
}

@property(nonatomic,retain) UIButton *btn_gu;
@property(nonatomic,retain) UIButton *btn_tyoki;
@property(nonatomic,retain) UIButton *btn_pa;
@property(nonatomic,retain) UIButton *btn_again;
@property(nonatomic,retain) UILabel  *lbl_mes;
@property(nonatomic,retain) UILabel  *lbl_kekka;
@property(nonatomic,retain) UILabel  *lbl_aite;
@property(nonatomic,retain) UIImageView *aite_img;

- (IBAction)btn_gu_down:(id)sender;
- (IBAction)btn_tyoki_down:(id)sender;
- (IBAction)btn_pa_down:(id)sender;
- (IBAction)btn_again_down:(id)sender;

@end
