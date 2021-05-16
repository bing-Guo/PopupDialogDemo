#import "OCViewController.h"
#import "DialogDemo-Swift.h"

@interface OCViewController ()

@property UIButton *button;
@property PopupDialog *dialog1;
@property PopupDialog *dialog2;

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupButton];
    [self setupDialog];
}

- (void)setupButton {
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setTitle:@"Show Dialog" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_button.layer setBorderWidth:2];
    [_button.layer setBorderColor:[UIColor blackColor].CGColor];
    _button.frame = CGRectMake(0, 0, 150.0, 44.0);
    _button.center = self.view.center;
    [_button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_button];
}

- (void)setupDialog {
    UIViewController *simpleOneViewController = [SampleOneViewController new];
    UIViewController *simpleTwoViewController = [SampleTwoViewController new];
    
    __weak __typeof(self) weakSelf = self;
    PopupDialogDefaultButton *nextButton = [[PopupDialogDefaultButton alloc] initWithTitle:@"NEXT" dismissOnTap:YES buttonHeight:44 action:^{
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf presentViewController:strongSelf->_dialog2 animated:YES completion:nil];
    }];
    
    PopupDialogDefaultButton *okButton = [[PopupDialogDefaultButton alloc] initWithTitle:@"OK" dismissOnTap:YES buttonHeight:44 action:^{
        NSLog(@"OK");
    }];
    
    _dialog1 = [[PopupDialog alloc] initWithViewController:simpleOneViewController tapGestureDismissal:NO];
    _dialog2 = [[PopupDialog alloc] initWithViewController:simpleTwoViewController tapGestureDismissal:NO];
    
    [_dialog1 addButtons:@[nextButton]];
    [_dialog2 addButtons:@[okButton]];
}

- (void)buttonTapped:(UIButton *)sender {
    [self presentViewController:_dialog1 animated:YES completion:nil];
}

@end
