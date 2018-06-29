#import "PageView.h"
@interface PageView() <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property(weak,nonatomic)NSArray *images;
@property(weak,nonatomic)NSTimer *timer;
@property(strong,nonatomic)NSNumber *times;
@end
@implementation PageView
//对象构建方法
+(instancetype)pageView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:self options:nil] lastObject];
}
//设置轮播图数组
-(void)setImages:(NSArray *)images{
    _images = images;
    int count = 0;
    for (NSString *imageName in images) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(count * self.frame.size.width, 0, self.frame.size.width,
                                     self.frame.size.height);
        [self.scrollView addSubview:imageView];
        count++;
    }
    //设置contentSize[内部控件可滚动大小]
    self.scrollView.contentSize = CGSizeMake(count * self.frame.size.width, 0);
    //设置分页滚动
    self.scrollView.pagingEnabled = YES;
    //除去滚动条
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
}



//初始化PageView控件
- (void)awakeFromNib{
    [super awakeFromNib];
    [self startTimer:self.times];
}

//设置分页定时器
-(void)startTimer:(NSNumber *)timeInterval{
    if(timeInterval==nil){
        timeInterval = @2.f;
    }
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval.floatValue target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    self.timer = timer;
}

//停止定时器
-(void)stopTimer{
    //使定时器失效
    [self.timer invalidate];
    self.timer = nil;
}

-(void)nextPage{
    //当前页数
    NSInteger page = self.pageControl.currentPage + 1;
    NSInteger number = self.pageControl.numberOfPages;
    //当页数大于页数总数时需要将页数归零
    if(page >= number){
        page = 0;
    }

    //设置偏移量为一个图片宽度
    CGFloat currentPageConut =  self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake(page * currentPageConut, 0) animated:YES];
}

//设置滚动时切换pageControl
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //计算分页的索引
    NSInteger index = self.scrollView.contentOffset.x / self.scrollView.frame.size.width + 0.5;
    self.pageControl.currentPage = index;
}

//当拖拽要开始时，需要停止调NSTimer定时器
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stopTimer];
}

//当拖拽结束后，重启定时器
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self startTimer:self.times];
}

@end
