//
//  KeyframeViewController.m
//  CoreAnimation
//
//  Created by user on 14-1-6.
//
//

#import "KeyframeViewController.h"

@interface KeyframeViewController ()

@end

@implementation KeyframeViewController

- (id)init {
    self = [super init];
    if (self) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

+ (NSString *)displayName {
	return @"显性动画:CAKeyframeAnimation";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 0, 0)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    
	// Do any additional setup after loading the view.
    
    CAKeyframeAnimation *boundsOvershootAnimation = [CAKeyframeAnimation animationWithKeyPath:@"bounds.size"];
    CGSize startingSize = CGSizeZero;
    CGSize targetSize = CGSizeMake(100,100);
    CGSize overshootSize = CGSizeMake(120,120);
    CGSize undershootSize = CGSizeMake(80,80);
    
    NSArray *boundsValues = [NSArray arrayWithObjects:[NSValue valueWithCGSize:startingSize],
                             [NSValue valueWithCGSize:targetSize],
                             [NSValue valueWithCGSize:overshootSize],
                             [NSValue valueWithCGSize:undershootSize],
                             [NSValue valueWithCGSize:targetSize], nil];
    [boundsOvershootAnimation setValues:boundsValues];
    
    NSArray *times = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0f],
                      [NSNumber numberWithFloat:0.5f],
                      [NSNumber numberWithFloat:0.8f],
                      [NSNumber numberWithFloat:0.9f],
                      [NSNumber numberWithFloat:1.0f], nil];    
    [boundsOvershootAnimation setKeyTimes:times];
    boundsOvershootAnimation.duration = 5.0;
    
    [view.layer addAnimation:boundsOvershootAnimation forKey:@"bound"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
