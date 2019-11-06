//
//  UIResponder+XUNUIKit.m
//  Pods
//
//  Created by xun on 2019/10/29.
//

#import "UIResponder+XUNUIKit.h"

@implementation UIResponder (XUNUIKit)

- (UIViewController *)xun_vc {
    return [self xun_nextResponderWithClass:UIViewController.class];
}

- (UINavigationController *)xun_nvc {
    return [self xun_nextResponderWithClass:UINavigationController.class];
}

- (UITabBarController *)xun_tbc {
    return [self xun_nextResponderWithClass:UINavigationController.class];
}

- (id)xun_nextResponderWithClass:(Class)class {
    
    UIResponder *responder = self.nextResponder;
    
    while (responder) {
        if ([responder isKindOfClass:class]) break;
        responder = responder.nextResponder;
    }
    return responder;
}
@end

@implementation UITableViewCell (BBUIResponder)

- (UITableView *)xun_tableView {
    return [self xun_nextResponderWithClass:UITableView.class];
}

- (NSIndexPath *)xun_indexPath {
    return [self.xun_tableView indexPathForCell:self];
}

@end

@implementation UICollectionViewCell (BBUIResponder)

- (UICollectionView *)xun_collectionView {
    return [self xun_nextResponderWithClass:UICollectionView.class];
}

- (NSIndexPath *)xun_indexPath {
    return [self.xun_collectionView indexPathForCell:self];
}


@end
