//
//  ViewController.m
//  janken
//
//  Created by Kitao Akiko on 13/02/09.
//  Copyright (c) 2013年 Kitao Akiko. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize btn_gu, btn_tyoki, btn_pa, btn_janken, btn_osaka_janken;
@synthesize lbl_mes,lbl_kekka, aite_img, kekka_img;


UIImage *gu_img;
UIImage *ch_img;
UIImage *pa_img;
UIImage *kati_img;
UIImage *make_img;

- (void)janken_sound {
    NSURL *jankenM4AURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"janken" ofType:@"m4a"]];
    SystemSoundID jankenSoundId;
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)jankenM4AURL, &jankenSoundId);
    CFRelease((__bridge CFTypeRef)(jankenM4AURL));
    AudioServicesPlaySystemSound(jankenSoundId);
//    AudioServicesDisposeSystemSoundID(jankenSoundId);
}

- (void)poi_sound {
    NSURL *poiM4AURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"poi" ofType:@"m4a"]];
    SystemSoundID poiSoundId;
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)poiM4AURL, &poiSoundId);
    CFRelease((__bridge CFTypeRef)(poiM4AURL));
    AudioServicesPlaySystemSound(poiSoundId);
//    AudioServicesDisposeSystemSoundID(poiSoundId);
}

- (void)aiko_sound {
    NSURL *aikoM4AURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"aiko" ofType:@"m4a"]];
    SystemSoundID aikoSoundId;
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)aikoM4AURL, &aikoSoundId);
    CFRelease((__bridge CFTypeRef)(aikoM4AURL));
    AudioServicesPlaySystemSound(aikoSoundId);
    //    AudioServicesDisposeSystemSoundID(jankenSoundId);
}

- (void)all_enable {
    self.btn_gu.hidden = NO;
    self.btn_gu.enabled = YES;
    self.btn_tyoki.hidden = NO;
    self.btn_tyoki.enabled = YES;
    self.btn_pa.hidden = NO;
    self.btn_pa.enabled = YES;
}

- (void)decide_aite_kekka {
    srand(time(nil));
    aite_kekka = rand()%3;
}

- (void)display_aite_img {
    if (aite_kekka == gu) {
        self.aite_img.image = gu_img;
    } else if (aite_kekka == choki) {
        self.aite_img.image = ch_img;
    } else {
        self.aite_img.image = pa_img;
    }
}

- (void)aiko {
    [self aiko_sound];
    self.lbl_kekka.textColor = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    self.lbl_kekka.text = @"あいこで・・・";
    self.kekka_img.hidden = YES;
}

- (void)kachi {
    [self poi_sound];
    self.lbl_kekka.textColor = [[UIColor alloc] initWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    self.lbl_kekka.text = @"かち";
    self.kekka_img.image = kati_img;
}

- (void)make {
    [self poi_sound];
    self.lbl_kekka.textColor = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:1.0 alpha:1.0];
    self.lbl_kekka.text = @"まけ";
    self.kekka_img.hidden = NO;
    self.kekka_img.image = make_img;
}

- (void)janken {
//    self.lbl_mes.text = @"じゃんけん・・・ぽん";
    self.aite_img.hidden = NO;
    self.kekka_img.hidden = NO;
    self.btn_janken.hidden = NO;
}

- (IBAction)btn_gu_down:(id)sender {
    self.btn_pa.hidden = YES;
    self.btn_tyoki.hidden = YES;
    [self janken];
    [self decide_aite_kekka];
    [self display_aite_img];

    if (aite_kekka == gu) {
        [self aiko];
        self.btn_pa.hidden = NO;
        self.btn_tyoki.hidden = NO;
        self.btn_janken.hidden = YES;
    } else if (aite_kekka == choki) {
        [self kachi];
        self.btn_gu.enabled = NO;
    } else {
        [self make];
        self.btn_gu.enabled = NO;
    }
}

- (IBAction)btn_tyoki_down:(id)sender {
    self.btn_pa.hidden = YES;
    self.btn_gu.hidden = YES;
    [self janken];
    [self decide_aite_kekka];
    [self display_aite_img];
    
    if (aite_kekka == choki) {
        [self aiko];
        self.btn_pa.hidden = NO;
        self.btn_gu.hidden = NO;
        self.btn_janken.hidden = YES;
    } else if (aite_kekka == pa) {
        [self kachi];
        self.btn_tyoki.enabled = NO;
    } else {
        [self make];
        self.btn_tyoki.enabled = NO;
    }
}

- (IBAction)btn_pa_down:(id)sender {
    self.btn_gu.hidden = YES;
    self.btn_tyoki.hidden = YES;
    [self janken];
    [self decide_aite_kekka];
    [self display_aite_img];
    
    if (aite_kekka == pa) {
        [self aiko];
        self.btn_gu.hidden = NO;
        self.btn_tyoki.hidden = NO;
        self.btn_janken.hidden = YES;
    } else if (aite_kekka == gu) {
        [self kachi];
        self.btn_pa.enabled = NO;
    } else {
        [self make];
        self.btn_pa.enabled = NO;
    }
}

- (IBAction)btn_janken_down:(id)sender {
    [self all_enable];
    self.btn_janken.hidden = YES;
    self.aite_img.hidden = YES;
    self.kekka_img.hidden = YES;
    
    self.lbl_mes.text = @"じゃんけん・・・";
    self.lbl_kekka.text = @"";

    [self janken_sound];
    
}

- (IBAction)btn_osaka_janken_down:(id)sender{
    SecondViewController *secondViewContoller = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    [self presentViewController:secondViewContoller animated:NO completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self all_enable];
    self.btn_janken.hidden = NO;
    self.btn_gu.enabled = NO;
    self.btn_tyoki.enabled = NO;
    self.btn_pa.enabled = NO;

    self.lbl_kekka.text = @"";
    self.lbl_kekka.font = [UIFont boldSystemFontOfSize:30];
    self.lbl_kekka.textColor = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    
    gu_img = [UIImage imageNamed:@"gu.png"];
    ch_img = [UIImage imageNamed:@"ch.png"];
    pa_img = [UIImage imageNamed:@"pa.png"];
    kati_img = [UIImage imageNamed:@"kati2.jpg"];
    make_img = [UIImage imageNamed:@"make1.jpg"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
