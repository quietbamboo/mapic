//
//  LocationlistViewController.m
//  template
//
//  Created by yujie liu on 12-7-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"
#define TableViewTag 100
@interface SecondViewController ()

@end

@implementation SecondViewController

#pragma mark 
#pragma mark DirectionsViewControllerDelegate methods

- (void)directionsViewControllerDidCancel:(HjxPhotoViewController *)viewController{
    
}

- (void)directionsViewController:(HjxPhotoViewController *)viewController toPlace:(Place *)endPlace{
    [viewController.navigationController popViewControllerAnimated:YES];
    [(FirstViewController *)[[AppDelegate getAppDelegate] firstview] showRouteLine:endPlace];
    self.tabBarController.selectedIndex = 0;
}

#pragma mark
#pragma mark initNSMUtable
-(void)initNStableArray{
    
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1500],@"Distance",@"andong.jpg",@"image",[NSNumber numberWithDouble:39.946996],@"lat",[NSNumber numberWithDouble:116.339281],@"lon",@"Yale University",@"name",@"Yale University is a private research university in New Haven, Connecticut, and a member of the Ivy League. Founded in 1701 in the Colony of Connecticut, the university is the third-oldest institution of higher education in the United States. Yale has produced many notable alumni, including five U.S. presidents, seventeen U.S. Supreme Court Justices, and several foreign heads of state.",@"dec",nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1200],@"Distance",@"logo.png",@"image",[NSNumber numberWithDouble:39.966996],@"lat",[NSNumber numberWithDouble:116.329281],@"lon",@"Harvard University",@"name",@"Harvard University (Harvard University) is the longest in U.S. history one of the first-class academic institution, is located in Cambridge, Massachusetts, and at Boston and across the Charles River. Harvard University has two colleges to recruit students, Harvard College and Radcliffe College, which recruited the students about half of all students at Harvard University. Ivy Harvard University is one of the school.",@"dec",nil];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1100],@"Distance",@"reset.png",@"image",[NSNumber numberWithDouble:39.976996],@"lat",[NSNumber numberWithDouble:116.359281],@"lon",@"University of Cambridge",@"name",@"The University of Cambridge (informally Cambridge University, or simply Cambridge) is the second oldest university in England and the fourth oldest in the world. In post-nominals the university's name is abbreviated as Cantab, a shortened form of Cantabrigiensis (an adjective derived from Cantabrigia, the Latinised form of Cambridge).",@"dec",nil];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1300],@"Distance",@"weibo.png",@"image",[NSNumber numberWithDouble:37.775812],@"lat",[NSNumber numberWithDouble:-122.406403],@"lon",@"北京大学",@"name",@"北京大学创办于1898年，初名京师大学堂，是中国第一所国立综合性大学，也是当时中国最高教育行政机关。辛亥革命后，于1912年改为现名。作为新文化运动的中心和“五四”运动的策源地，作为中国最早传播马克思主义和民主科学思想的发祥地，作为中国共产党最早的活动基地，北京大学为民族的振兴和解放、国家的建设和发展、社会的文明和进步做出了不可替代的贡献，在中国走向现代化的进程中起到了重要的先锋作用。爱国、进步、民主、科学的传统精神和勤奋、严谨、求实、创新的学风在这里生生不息、代代相传。",@"dec",nil];
    NSDictionary *dic5 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1400],@"Distance",@"logo.png",@"image",[NSNumber numberWithDouble:37.775812],@"lat",[NSNumber numberWithDouble:-122.426403],@"lon",@"故宫",@"name",@"在北京市中心，也称紫禁城，是明清两代的皇宫，先后居住过24个皇帝。现辟为故宫博物院。紫禁城被称为“殿宇之海”，总面积72万多平方米，有殿宇宫室9999间半。周围环绕着高10米，长3400米的宫墙，墙外有52米宽的护城河。紫禁城分外朝和内廷两大部分。外朝以太和、中和、保和三大殿为中心，文华、武英殿为两翼；内廷以乾清宫、交泰殿、坤宁宫为中心，东西六宫为两翼，布局严谨有序。一条从午门、三大殿、后三宫直达御花园的钦安殿和神武门的中路，构成了整个故宫的中轴。这个中轴又在北京城的中轴线上。在紫禁城中轴宫殿两旁，还对称分布着许多殿宇，也都宏伟华丽。紫禁城4个城角都有精巧玲珑的角楼，所谓“九梁十八柱”，异常美观。故宫博物院内陈列我国各个朝代的艺术珍品，是中国最丰富的文化和艺术的宝库。故宫的整个建筑金碧辉煌，庄严绚丽，被誉为世界五大宫之一（北京故宫、凡尔赛宫、白金汉宫、白宫、克里姆林宫），并为联合国科教文组织列为“世界文化遗产”。",@"dec",nil];
    NSDictionary *dic6 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1600],@"Distance",@"reset.png",@"image",[NSNumber numberWithDouble:37.775812],@"lat",[NSNumber numberWithDouble:-122.416403],@"lon",@"北海公园",@"name",@"位于故宫西北。北海占地70余万平方米，水面占全园面积一半以上。北海及其南面的中海和南海均为皇城内最重要的皇家园林，因位于紫禁城西，当时统称为西苑。琼华岛是北海景物的中心，也是历代帝王心目中的海上仙山。清顺治8年（公元1651年）在琼华岛山顶建喇嘛塔（白塔），山前建佛寺。北海北岸布置了几组宗教建筑，有：小西天、大西天、阐福寺，西天梵境等，还有五色琉璃镶砌的九龙壁，两面各有蟠龙9条，戏珠于波涛云际，造型生动，色彩明快。园内还保存有文物铁影壁、一座16面多角形塔式石幢、495方历代著名书法家真迹、万岁山团城和承光殿玉佛等",@"dec",nil];
    nsArray = [[NSMutableArray alloc] initWithCapacity:0];
    if (isloading) {
        [nsArray removeAllObjects];
        [nsArray addObject:dic6];
        [nsArray addObject:dic5];
        [nsArray addObject:dic4];
        [nsArray addObject:dic3];
        [nsArray addObject:dic2];
        [nsArray addObject:dic1];
    }else {
        [nsArray addObject:dic1];
        [nsArray addObject:dic2];
        [nsArray addObject:dic3];
        [nsArray addObject:dic4];
        [nsArray addObject:dic5];
        [nsArray addObject:dic6];
    }
    
}


#pragma mark
#pragma mark UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [nsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";  
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:  
                             SimpleTableIdentifier];  
    if (cell == nil) {    
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle 
                                       reuseIdentifier:SimpleTableIdentifier] autorelease];  
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    Place *place = [[Place alloc] init];
    NSDictionary *nsdic = [nsArray objectAtIndex:indexPath.row];
    //    place.btnTag = i;
    //    place.name = [nsdic objectForKey:@"name"];
    //    place.image = [UIImage imageNamed:[nsdic objectForKey:@"image"]];
    //    place.latitude = [(NSNumber *)[nsdic objectForKey:@"lat"] doubleValue];
    //    place.longitude = [(NSNumber *)[nsdic objectForKey:@"lon"] doubleValue];
    //    place.description = [NSString stringWithFormat:@"%@:%f",[nsdic objectForKey:@"dec"],[nsdic objectForKey:@"Distance"]];
    //    PlaceMark *placeMark = [[PlaceMark alloc] initWithPlace:place];
    //    [self.mainMapView addAnnotation:placeMark];
    //    [place release];
    //    [placeMark release];
    
    //    cell.imageView.image = [UIImage imageNamed:[nsdic objectForKey:@"image"]];
    //    // cell.imageView.highlightedImage = [UIImage imageNamed:@"flag.png"];//选中cell后的图片 
    //    //cell.textLabel.font =  [UIFont boldSystemFontOfSize:10];-
    //    cell.textLabel.text = @" ";//[nsdic objectForKey:@"name"];
    //    cell.detailTextLabel.text = [NSString stringWithFormat:@"距离:%d%@",[(NSNumber *)[nsdic objectForKey:@"Distance"] intValue],@"米"];
    //    UILabel *namelable = [[UILabel alloc] initWithFrame:CGRectMake(60, 2.0, 130, 30.0)];
    //    namelable.text = [nsdic objectForKey:@"name"];
    //    namelable.font = [UIFont boldSystemFontOfSize:15];     
    //    namelable.textColor = [UIColor blackColor];         
    //    namelable.textAlignment = UITextAlignmentLeft; 
    //    namelable.numberOfLines = 1;
    //    namelable.lineBreakMode = UILineBreakModeTailTruncation;
    //    [cell.contentView addSubview:namelable];
    //    [namelable release];
    //
    //    UILabel *desclabel = [[UILabel alloc]initWithFrame:CGRectMake(195.0, 2.0, 80.0, 56.0)];
    //    desclabel.text = [nsdic objectForKey:@"dec"];   
    //    
    //    desclabel.font = [UIFont boldSystemFontOfSize:10];     
    //    desclabel.textColor = [UIColor purpleColor];         
    //    desclabel.textAlignment = UITextAlignmentLeft; 
    //    desclabel.numberOfLines = 3;
    //    desclabel.lineBreakMode = UILineBreakModeTailTruncation;
    //    [cell.contentView addSubview:desclabel];
    //    [desclabel release];
    
    CellView *cellview = [[CellView alloc] initWithFrame:CGRectMake(0, 2, 285,62)];
    cellview.imageView.image = [UIImage imageNamed:[nsdic objectForKey:@"image"]];
    cellview.namelabel.text = [nsdic objectForKey:@"name"];
    cellview.distancelabel.text = [NSString stringWithFormat:@"距离:%d%@",[(NSNumber *)[nsdic objectForKey:@"Distance"] intValue],@"米"];
    cellview.desclabel.text = [nsdic objectForKey:@"dec"];
    [cell.contentView addSubview:cellview];
    [cellview release];
    
    return cell;  
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 66;
}
#pragma mark
#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    //    NSLog(@"this good 1");
    //    DeatilViewController *detail = [[DeatilViewController alloc] init];
    HjxPhotoViewController *hjxPhotoview = [[HjxPhotoViewController alloc] initWithNibName:nil bundle:nil];
    switch (indexPath.row) {
        case 0:
            hjxPhotoview.clicked = @"tt://photo/top";
            break;
        case 1:
            hjxPhotoview.clicked = @"tt://photo/random";
            break;
        case 2:
            hjxPhotoview.clicked = @"tt://photo/hd";
            break;
        case 3:
            hjxPhotoview.clicked = @"tt://photo/my";
            break;
        case 4:
            hjxPhotoview.clicked = @"tt://photo/like";
            break;
        case 5:
            hjxPhotoview.clicked = @"tt://photo/recent.like";
            break;
        default:
            break;
    }
    hjxPhotoview.delegate = self;
    Place *place = [[Place alloc] init];
    NSDictionary *nsdic = [nsArray objectAtIndex:indexPath.row];
    place.name = [nsdic objectForKey:@"name"];
    place.image = [UIImage imageNamed:[nsdic objectForKey:@"image"]];
    place.latitude = [(NSNumber *)[nsdic objectForKey:@"lat"] doubleValue];
    place.longitude = [(NSNumber *)[nsdic objectForKey:@"lon"] doubleValue];
    place.description = [nsdic objectForKey:@"dec"];
    hjxPhotoview.endPlace = place;
    //    [self.navigationController pushViewController:detail animated:YES];
    //    [detail release];
    
    self.navigationController.navigationBarHidden = NO;
    [AppDelegate getAppDelegate].centerButton.hidden = YES;
    [self.navigationController pushViewController:hjxPhotoview animated:YES];
    [hjxPhotoview release];
    [place release];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    NSLog(@"this good 1");
    //    DeatilViewController *detail = [[DeatilViewController alloc] init];
    HjxPhotoViewController *hjxPhotoview = [[HjxPhotoViewController alloc] initWithNibName:nil bundle:nil];
    switch (indexPath.row) {
        case 0:
            hjxPhotoview.clicked = @"tt://photo/top";
            break;
        case 1:
            hjxPhotoview.clicked = @"tt://photo/random";
            break;
        case 2:
            hjxPhotoview.clicked = @"tt://photo/hd";
            break;
        case 3:
            hjxPhotoview.clicked = @"tt://photo/my";
            break;
        case 4:
            hjxPhotoview.clicked = @"tt://photo/like";
            break;
        case 5:
            hjxPhotoview.clicked = @"tt://photo/recent.like";
            break;
        default:
            break;
    }
    hjxPhotoview.delegate = self;
    Place *place = [[Place alloc] init];
    NSDictionary *nsdic = [nsArray objectAtIndex:indexPath.row];
    place.name = [nsdic objectForKey:@"name"];
    place.image = [UIImage imageNamed:[nsdic objectForKey:@"image"]];
    place.latitude = [(NSNumber *)[nsdic objectForKey:@"lat"] doubleValue];
    place.longitude = [(NSNumber *)[nsdic objectForKey:@"lon"] doubleValue];
    place.description = [nsdic objectForKey:@"dec"];
    hjxPhotoview.endPlace = place;
    //    [self.navigationController pushViewController:detail animated:YES];
    //    [detail release];
    
    self.navigationController.navigationBarHidden = NO;
    [AppDelegate getAppDelegate].centerButton.hidden = YES;
    [self.navigationController pushViewController:hjxPhotoview animated:YES];
    [hjxPhotoview release];
    [place release];
}

#pragma mark
#pragma mark default Methods
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        isloading = NO;
    }
    return self;
}

- (id)init {
    self = [super init];
    isloading = NO;
    return self;
}

- (void)loadView {
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
    [contentView release];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [AppDelegate getAppDelegate].centerButton.hidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initNStableArray];
    JMTabView *tabHeaderView = [[[JMTabView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60.0f)] autorelease];
    [tabHeaderView setDelegate:self];
    [tabHeaderView addTabItemWithTitle:@"newest" icon:[UIImage imageNamed:@"icon1.png"]];
    [tabHeaderView addTabItemWithTitle:@"closest" icon:[UIImage imageNamed:@"icon2.png"]];
    [tabHeaderView addTabItemWithTitle:@"nearby" icon:[UIImage imageNamed:@"icon3.png"]];
    //    You can run blocks by specifiying an executeBlock: paremeter
    //    #if NS_BLOCKS_AVAILABLE
    //    [tabView addTabItemWithTitle:@"One" icon:nil executeBlock:^{NSLog(@"abc");}];
    //    #endif
    [tabHeaderView setSelectedIndex:0];
    
    UITableView *tableview= [[UITableView alloc] initWithFrame:CGRectMake(0,60, 320, 371) style:UITableViewStylePlain];
    tableview.separatorStyle = UITableViewStyleGrouped;
    //tableview.separatorColor = [UIColor blackColor];
    tableview.tag = TableViewTag;
    [tableview setDelegate:self];
    [tableview setDataSource:self];
    [self.view addSubview: tableview];
    
    refreshControl = [[ODRefreshControl alloc] initInScrollView:tableview];
    [refreshControl addTarget:self action:@selector(dropViewDidBeginRefreshing:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:tabHeaderView];
    [tableview release];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark
#pragma mark JMTabViewDelegate Method
-(void)tabView:(JMTabView *)tabView didSelectTabAtIndex:(NSUInteger)itemIndex;
{
    NSLog(@"Selected Tab Index: %d", itemIndex);
}

#pragma mark
#pragma mark ODRefreshControl Method
- (void)dropViewDidBeginRefreshing:(ODRefreshControl *)refreshControl
{
    double delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self doSomeThing];
    });
}

- (void)doSomeThing{
    [refreshControl endRefreshing];
}
@end
