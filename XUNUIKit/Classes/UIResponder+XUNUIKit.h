//
//  UIResponder+XUNUIKit.h
//  Pods
//
//  Created by xun on 2019/10/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (XUNUIKit)
@property (nullable, readonly) UIViewController *xun_vc;
@property (nullable, readonly) UINavigationController *xun_nvc;
@property (nullable, readonly) UITabBarController *xun_tbc;

- (id)xun_nextResponderWithClass:(Class)class;
@end

@interface UITableViewCell (XUNUIKit)
@property (nullable, readonly) NSIndexPath *xun_indexPath;
@property (nullable, readonly) UITableView *xun_tableView;
@end

@interface UICollectionViewCell (XUNUIKit)
@property (nullable, readonly) NSIndexPath *xun_indexPath;
@property (nullable, readonly) UICollectionView *xun_collectionView;
@end

NS_ASSUME_NONNULL_END
