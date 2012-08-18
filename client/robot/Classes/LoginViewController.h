//
//  LoginViewController.h
//  template
//
//  Created by 健峰 高 on 12-8-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
#import "MyMD5.h"
@interface LoginViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,ASIHTTPRequestDelegate,UIAlertViewDelegate>{
    UITextField *usernametext;
    UITextField *passwordtext;
}

@end
