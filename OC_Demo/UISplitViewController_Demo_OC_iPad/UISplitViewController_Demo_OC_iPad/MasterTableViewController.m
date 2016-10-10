//
//  MasterTableViewController.m
//  UISplitViewController_Demo_OC_iPad
//
//  Created by Sunhy on 16/10/8.
//  Copyright © 2016年 Sunhy. All rights reserved.
//

#import "MasterTableViewController.h"
#import "ViewController.h"
#import "CustomViewController1.h"
#import "CustomViewController2.h"
#import "CustomViewController3.h"

@interface MasterTableViewController ()

@property (nonatomic, strong) NSMutableArray *dataSourceArray;
@property (nonatomic, weak) ViewController *splitVC;

@end

@implementation MasterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSourceArray = [NSMutableArray arrayWithArray:@[@"hello",@"world", @"hi"]];
    // remove empty cells in UITableView
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"REUSE_CELL" forIndexPath:indexPath];
    // 设置Cell颜色
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor blueColor];
    [cell setSelectedBackgroundView:view];
    cell.textLabel.text = [NSString stringWithFormat:@"cell%d", indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"TestImage"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomViewController1 *cVC1;
    CustomViewController1 *cVC2;
    CustomViewController1 *cVC3;
#ifdef DEBUG
    NSLog(@"primaryWidth:%f minWidth:%f maxWidth:%f", self.splitVC.primaryColumnWidth, self.splitVC.minimumPrimaryColumnWidth, self.splitVC.maximumPrimaryColumnWidth);
#endif
    switch (indexPath.row) {
        case 0:
            cVC1 = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"customVC1"];
            [self.splitVC showDetailViewController:cVC1 sender:self.splitVC];
            break;
        case 1:
            cVC2 = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"customVC2"];
            [self.splitVC showDetailViewController:cVC2 sender:self.splitVC];
            break;
        case 2:
            cVC3 = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"customVC3"];
            [self.splitVC showDetailViewController:cVC3 sender:self.splitVC];
            break;
        default:
            break;
    }
    
    
}

- (ViewController *)splitVC {
    if (!_splitVC) {
        _splitVC = (ViewController *)self.splitViewController;
    }
    return _splitVC;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
