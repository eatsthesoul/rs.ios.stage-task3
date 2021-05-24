//
//  TreeNode.h
//  ios.stage-task
//
//  Created by Evgeniy Petlitskiy on 24.05.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode: NSObject

@property(nonatomic, retain) NSNumber *value;
@property(nonatomic, retain, nullable) TreeNode *leftNode;
@property(nonatomic, retain, nullable) TreeNode *rightNode;

- (instancetype)initWithValue:(id)value;
+ (instancetype)treeFromArray:(NSMutableArray *)array;
+ (NSArray *)getLevelOrderTraversal:(TreeNode *)root;

@end

NS_ASSUME_NONNULL_END
