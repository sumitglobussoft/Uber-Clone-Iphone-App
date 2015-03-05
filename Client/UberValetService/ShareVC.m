//
//  ShareVC.m
//  UberValetService
//
//  Created by Globussoft 1 on 11/26/14.
//  Copyright (c) 2014 Globussoft 1. All rights reserved.
//

#import "ShareVC.h"
#import "mainAppDelegate.h"
#import <Social/Social.h>
#import <Twitter/Twitter.h>
#import <MessageUI/MessageUI.h>



@interface ShareVC (){
    mainAppDelegate  *appDelegate;
}
@end

@implementation ShareVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *twitterButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [twitterButton addTarget:self action:@selector(twitterShare) forControlEvents:UIControlEventTouchUpInside];
    twitterButton.backgroundColor = [UIColor redColor];
    [twitterButton setTitle:@"Twitter" forState:UIControlStateNormal];
    twitterButton.frame = CGRectMake(40, 200, 70, 50) ;
    [self.view addSubview:twitterButton];
    
    
    UIButton *FbButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [FbButton addTarget:self action:@selector(facebookBtnClick) forControlEvents:UIControlEventTouchUpInside];
    FbButton.backgroundColor = [UIColor blueColor];
    [FbButton setTitle:@"Facebook" forState:UIControlStateNormal];
    FbButton.frame = CGRectMake(110, 200, 90, 50) ;
    [self.view addSubview:FbButton];
    
    
    UIButton *textBUtton=[UIButton buttonWithType:UIButtonTypeCustom];
    [textBUtton addTarget:self action:@selector(textAction:) forControlEvents:UIControlEventTouchUpInside];
    textBUtton.backgroundColor = [UIColor redColor];
    [textBUtton setTitle:@"Text" forState:UIControlStateNormal];
    textBUtton.frame = CGRectMake(200, 200, 70, 50) ;
    [self.view addSubview:textBUtton];

    
    // Do any additional setup after loading the view.
}

-(void)facebookBtnClick {
    
    NSString *strPostMessage = @"Enjoy Ride";
    NSLog(@"Message == %@",strPostMessage);
    
    NSString * strLife = @"Uber app.";
    NSMutableDictionary *params =
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     strPostMessage, @"description", strLife, @"caption",
     @"https://globussoft.com", @"link",@"Uber app ",@"name",
     @"i.imgur.com/1612f7A.png?1",@"picture",
     nil];
    
    appDelegate = (mainAppDelegate *)[UIApplication sharedApplication].delegate;
    
    if (FBSession.activeSession.isOpen) {
        
        [self shareOnFacebookWithParams:params];
    }
    else{
        [appDelegate openSessionWithLoginUI:1 withParams:params];
    }
    
}


#pragma mark ------ share on facebook.
-(void) shareOnFacebookWithParams:(NSDictionary *)params{
    
    [FBWebDialogs presentFeedDialogModallyWithSession:nil parameters:params handler:^(FBWebDialogResult result, NSURL *resultUrl, NSError *error){
        
        if (error) {
            NSLog(@"Error to post on facebook = %@", [error localizedDescription]);
        }
        else{
            
            
            if (result == FBWebDialogResultDialogNotCompleted) {
                NSLog(@"Error to post on facebook = %@", [error localizedDescription]);
                NSLog(@"User cancel Request");
            }//End Result Check
            else{
                NSString *sss= [NSString stringWithFormat:@"%@",resultUrl];
                if ([sss rangeOfString:@"post_id"].location == NSNotFound) {
                    NSLog(@"User Cancel Share");
                }
                else{
                    NSLog(@"posted on wall");
                }
            }//End Else Block Result Check
        }
    }];
}



-(void)twitterShare{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        SLComposeViewControllerCompletionHandler myBlock = ^(SLComposeViewControllerResult result){
            if (result == SLComposeViewControllerResultCancelled) {
                
                NSLog(@"Cancelled");
                
            } else
                
            {
                NSLog(@"Done");
            }
            
            [controller dismissViewControllerAnimated:YES completion:Nil];
        };
        controller.completionHandler =myBlock;
        
            //Adding the Text to the facebook post value from iOS
        [controller setInitialText:@"Test Post from mobile.safilsunny.com"];
        
            //Adding the URL to the facebook post value from iOS
        
        [controller addURL:[NSURL URLWithString:@"http://www.mobile.safilsunny.com"]];
        
            //Adding the Image to the facebook post value from iOS
        
        [controller addImage:[UIImage imageNamed:@"fb.png"]];
        
//        [self presentViewController:controller animated:YES completion:Nil];
        [self.view addSubview:controller.view];
    }
    else{
        NSLog(@"UnAvailable");
    }
    
}

-(void)textAction:(UIButton *)button{
    
    NSLog(@"in text action");
    NSString *selectedFile = @"Hello client";
    [self showSMS:selectedFile];
    
    
}


- (void)showSMS:(NSString*)file {
    
    if(![MFMessageComposeViewController canSendText]) {
        UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device doesn't support SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [warningAlert show];
        return;
    }
    
    NSArray *recipents = @[@"12345678", @"72345524"];
    NSString *message = [NSString stringWithFormat:@"Just sent the %@ file to your email. Please check!", file];
    
    messageController = [[MFMessageComposeViewController alloc] init];
    
    messageController.messageComposeDelegate = self;
    [messageController setRecipients:recipents];
    [messageController setBody:message];
    
        // Present message view controller on screen
    [self addChildViewController:messageController];
    [self.view addSubview:messageController.view];
        //    [self presentViewController:messageController animated:YES completion:nil];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result
{
    switch (result) {
        case MessageComposeResultCancelled:
            break;
            
        case MessageComposeResultFailed:
        {
            UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to send SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [warningAlert show];
            break;
        }
            
        case MessageComposeResultSent:
            break;
            
        default:
            break;
    }
    
    [controller removeFromParentViewController];
        //  [self dismissViewControllerAnimated:YES completion:nil];
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

@end