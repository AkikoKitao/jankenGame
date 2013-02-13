//
//  ViewController.m
//  janken
//
//  Created by Kitao Akiko on 13/02/09.
//  Copyright (c) 2013年 Kitao Akiko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize btn_gu, btn_tyoki, btn_pa, btn_again;
@synthesize lbl_mes,lbl_kekka,lbl_aite, aite_img;

UIImage *gu_img;
UIImage *ch_img;
UIImage *pa_img;

- (IBAction)btn_gu_down:(id)sender {
    self.lbl_mes.text = @"じゃんけん・・・ぽん";
    self.btn_pa.hidden = YES;
    self.btn_tyoki.hidden = YES;
    self.lbl_aite.hidden = NO;
    self.aite_img.hidden = NO;
    self.btn_again.hidden = NO;
    
    srand(time(nil));
    NSInteger kekka;
    kekka = rand()%3;
    if (kekka == 0) {
       self.aite_img.image = gu_img;
    } else if (kekka == 1) {
       self.aite_img.image = ch_img;
    } else {
       self.aite_img.image = pa_img;
    }
    
    if (kekka == 0) {
        self.lbl_kekka.text = @"あいこで・・・";
        self.btn_pa.hidden = NO;
        self.btn_tyoki.hidden = NO;
        self.btn_again.hidden = YES;
    } else if (kekka == 1) {
        self.lbl_kekka.text = @"あなたのかち";
        self.btn_gu.enabled = NO;
    } else {
        self.lbl_kekka.text = @"あなたのまけ";
        self.btn_gu.enabled = NO;
    }
}

- (IBAction)btn_tyoki_down:(id)sender {
    self.lbl_mes.text = @"じゃんけん・・・ぽん";
    self.btn_pa.hidden = YES;
    self.btn_gu.hidden = YES;
    self.lbl_aite.hidden = NO;
    self.aite_img.hidden = NO;
    self.btn_again.hidden = NO;
    
    srand(time(nil));
    NSInteger kekka;
    kekka = rand()%3;
    if (kekka == 0) {
        self.aite_img.image = gu_img;
    } else if (kekka == 1) {
        self.aite_img.image = ch_img;
    } else {
        self.aite_img.image = pa_img;
    }
    
    if (kekka == 1) {
        self.lbl_kekka.text = @"あいこで・・・";
        self.btn_pa.hidden = NO;
        self.btn_gu.hidden = NO;
        self.btn_again.hidden = YES;
    } else if (kekka == 2) {
        self.lbl_kekka.text = @"あなたのかち";
        self.btn_tyoki.enabled = NO;
    } else {
        self.lbl_kekka.text = @"あなたのまけ";
        self.btn_tyoki.enabled = NO;
    }
}

- (IBAction)btn_pa_down:(id)sender {
    self.lbl_mes.text = @"じゃんけん・・・ぽん";
    self.btn_gu.hidden = YES;
    self.btn_tyoki.hidden = YES;
    self.lbl_aite.hidden = NO;
    self.aite_img.hidden = NO;
    self.btn_again.hidden = NO;
       
    srand(time(nil));
    NSInteger kekka;
    kekka = rand()%3;
    if (kekka == 0) {
        self.aite_img.image = gu_img;
    } else if (kekka == 1) {
        self.aite_img.image = ch_img;
    } else {
        self.aite_img.image = pa_img;
    }
    
    if (kekka == 2) {
        self.lbl_kekka.text = @"あいこで・・・";
        self.btn_gu.hidden = NO;
        self.btn_tyoki.hidden = NO;
        self.btn_again.hidden = YES;
    } else if (kekka == 1) {
        self.lbl_kekka.text = @"あなたのかち";
        self.btn_pa.enabled = NO;
    } else {
        self.lbl_kekka.text = @"あなたのまけ";
        self.btn_pa.enabled = NO;
    }
}

- (IBAction)btn_again_down:(id)sender {
    self.btn_gu.hidden = NO;
    self.btn_gu.enabled = YES;
    self.btn_tyoki.hidden = NO;
    self.btn_tyoki.enabled = YES;
    self.btn_pa.hidden = NO;
    self.btn_pa.enabled = YES;
    self.btn_again.hidden = YES;
    self.lbl_aite.hidden = YES;
        self.aite_img.hidden = YES;
    self.lbl_mes.text = @"じゃんけん・・・";
    self.lbl_kekka.text = @"";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.btn_again.hidden = YES;
    self.lbl_aite.hidden = YES;
    self.lbl_kekka.text = @"";
 
    gu_img = [UIImage imageNamed:@"gu.png"];
    ch_img = [UIImage imageNamed:@"ch.png"];
    pa_img = [UIImage imageNamed:@"pa.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
