//
//  ViewController.h
//  janken
//
//  Created by Kitao Akiko on 13/02/09.
//  Copyright (c) 2013年 Kitao Akiko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>



@interface ViewController : UIViewController{
    IBOutlet UIButton *btn_gu;
    IBOutlet UIButton *btn_tyoki;
    IBOutlet UIButton *btn_pa;
    IBOutlet UIButton *btn_janken;
    IBOutlet UIButton *btn_osaka_janken;
    IBOutlet UILabel  *lbl_mes;
    IBOutlet UILabel  *lbl_kekka;
    IBOutlet UILabel  *lbl_aite;
    IBOutlet UIImageView *aite_img;
    NSInteger aite_kekka;
}

@property(nonatomic,retain) UIButton *btn_gu;
@property(nonatomic,retain) UIButton *btn_tyoki;
@property(nonatomic,retain) UIButton *btn_pa;
@property(nonatomic,retain) UIButton *btn_janken;
@property(nonatomic,retain) UIButton *btn_osaka_janken;
@property(nonatomic,retain) UILabel  *lbl_mes;
@property(nonatomic,retain) UILabel  *lbl_kekka;
@property(nonatomic,retain) UILabel  *lbl_aite;
@property(nonatomic,retain) UIImageView *aite_img;

- (IBAction)btn_gu_down:(id)sender;
- (IBAction)btn_tyoki_down:(id)sender;
- (IBAction)btn_pa_down:(id)sender;
- (IBAction)btn_janken_down:(id)sender;
- (IBAction)btn_osaka_janken_down:(id)sender;
- (void)decide_aite_kekka;
- (void)display_aite_img;
- (void)janken_sound;
- (void)aiko_sound;

enum {
    gu,
    choki,
    pa
};

@end

