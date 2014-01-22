//
//  UITableView+NUI.m
//  Pods
//
//  Created by Tobias Heinicke on 19.06.13.
//
//

#import "UITableView+NUI.h"

@implementation UITableView (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"Table";
    }
}

- (void)applyNUI
{
    [self initNUI];
    if (![self.nuiClass isEqualToString:kNUIClassNone]) {
        [NUIRenderer renderTableView:self withClass:self.nuiClass];
        [NUIRenderer addOrientationWillChangeObserver:self];
    }
    self.nuiApplied = YES;
}

- (void)orientationWillChange:(NSNotification*)notification
{
    [NUIRenderer performSelector:@selector(sizeDidChangeForTableView:) withObject:self afterDelay:0];
}

- (void)override_dealloc {
    [NUIRenderer removeOrientationWillChangeObserver:self];
    [self override_dealloc];
}

@end

