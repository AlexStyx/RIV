//
//  TestViewController.m
//  RIV
//
//  Created by Александр Бисеров on 17.03.2023.
//

#import "TestViewController.h"
#import "RIV-Swift.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [ModuleBuilder buildOnViewReady:^(id<ModuleInput> _Nonnull) {
        
    }]
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
