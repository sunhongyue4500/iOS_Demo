//
//  MasterTableViewController.h
//  UISplitViewController_Demo_OC_iPad
//
//  Created by Sunhy on 16/10/8.
//  Copyright © 2016年 Sunhy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MasterTableViewController <NSObject>

- (void)masterTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface MasterTableViewController : UITableViewController

@property (nonatomic, weak) id<MasterTableViewController> delegate;

@end
