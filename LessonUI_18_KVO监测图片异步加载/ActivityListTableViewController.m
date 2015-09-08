//
//  ActivityListTableViewController.m
//  LessonUI_18_KVO监测图片异步加载
//
//  Created by YesterdayFinder on 15/9/8.
//  Copyright (c) 2015年 YesterdayFinder. All rights reserved.
//

#import "ActivityListTableViewController.h"
#import "Activity.h"
#import "ActivityTableViewCell.h"

#define kActivityListURL @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/activitylist.php"

@interface ActivityListTableViewController ()
@property (nonatomic, retain) NSMutableArray *activitiesArray;  //所有活动对象
@end

@implementation ActivityListTableViewController
- (void)dealloc
{
    [_activitiesArray release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:kActivityListURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    __block ActivityListTableViewController *TVC = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (data) {
            TVC.activitiesArray = [NSMutableArray array];
            NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray *eventsArray = dict[@"events"];
            for (NSDictionary *dict in eventsArray) {
                Activity *activity = [[Activity alloc] init];
                //KVC
                [activity setValuesForKeysWithDictionary:dict];
                //添加
                [TVC.activitiesArray addObject:activity];
            }
        }
        
        [TVC.tableView reloadData];
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _activitiesArray.count;
}

///*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Activity *activity = _activitiesArray[indexPath.row];
    
    
    if (!activity.picture) {
        [activity loadImage];
        //1.添加观察者
        [activity addObserver:self forKeyPath:@"picture" options:NSKeyValueObservingOptionNew context:[indexPath retain]];
        
    } else {
        cell.imgView.image = activity.picture;
    }
    
    cell.activity = activity;
    
    
    return cell;
}
//*/

//2.实现观察者方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //1.1获取picture改变之后的值,即得到每次传过来的图片
    UIImage *image = [change objectForKey:@"new"];
    //1.2通过context(indexPath)获取要显示图片的cell
    NSIndexPath *indexPath = (NSIndexPath *)context;
    //获取当前屏幕上正在显示的cell
    NSArray *showArray = [self.tableView indexPathsForVisibleRows]; //所有当前正在显示的cell的indexPath
    //判断当前activity对象(或其picture)是否对应当前showArray中正在显示的cell
    if ([showArray containsObject:indexPath]) {
        //获取indexPath的cell
    }
    ActivityTableViewCell *cell = (ActivityTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    cell.imgView.image = image;
    
    [indexPath release];
//4.移除观察者
    [object removeObserver:self forKeyPath:keyPath context:context];
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
