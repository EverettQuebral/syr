//
//  SyrHapticHelper.m
//  SyrNative
//
//  Created by Malkireddy, Siddharth on 3/7/18.
//  Copyright © 2018 Anderson,Derek. All rights reserved.
//

// credit Emre YANIK

#import "SyrHapticHelper.h"

@implementation SyrHapticHelper

+(void)generateFeedback:(NSString*)type{
    
    if ([[UIDevice currentDevice] systemVersion].floatValue < 10.0){
        return;
    }
    
    if([type isEqualToString:@"selection"]) {
         [self generateSelectionFeedback];
    } else if([type isEqualToString:@"impactLight"]) {
         [self generateImpactFeedback:UIImpactFeedbackStyleLight];
    } else if([type isEqualToString:@"impactMedium"]) {
         [self generateImpactFeedback:UIImpactFeedbackStyleMedium];
    }else if([type isEqualToString:@"impactHeavy"]) {
        [self generateImpactFeedback:UIImpactFeedbackStyleHeavy];
    }else if([type isEqualToString:@"notificationSuccess"]) {
         [self generateNotificationFeedback:UINotificationFeedbackTypeSuccess];
    }else if([type isEqualToString:@"notificationWarning"]) {
         [self generateNotificationFeedback:UINotificationFeedbackTypeWarning];
    }else if([type isEqualToString:@"notificationError"]) {
       [self generateNotificationFeedback:UINotificationFeedbackTypeError];
    }
}

+(void)generateSelectionFeedback{
    UISelectionFeedbackGenerator *generator = [[UISelectionFeedbackGenerator alloc] init];
    [generator prepare];
    [generator selectionChanged];
    generator = nil;
}

+(void)generateImpactFeedback:(UIImpactFeedbackStyle)style{
    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:style];
    [generator prepare];
    [generator impactOccurred];
    generator = nil;
}

+(void)generateNotificationFeedback:(UINotificationFeedbackType)notificationType{
    UINotificationFeedbackGenerator *generator = [[UINotificationFeedbackGenerator alloc] init];
    [generator prepare];
    [generator notificationOccurred:notificationType];
    generator = nil;
}

@end
