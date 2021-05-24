//
//  TreeNode.m
//  ios.stage-task
//
//  Created by Evgeniy Petlitskiy on 24.05.21.
//

#import "TreeNode.h"

@implementation TreeNode: NSObject

- (instancetype)initWithValue:(id)value {
    self = [super init];
    if (self) {
        _value = value;
        _leftNode = nil;
        _rightNode = nil;
    }
    return self;
}

+ (instancetype)treeFromArray:(NSMutableArray *)array {
    
    if (array.count == 0) {
        return nil;
    }

    if (array.firstObject == [NSNull null]) {
        [array removeObjectAtIndex:0];
        return nil;
    }
    
    TreeNode *root = [[TreeNode alloc] initWithValue:array.firstObject];
    [array removeObjectAtIndex:0];

    root.leftNode  = [TreeNode treeFromArray:array];
    root.rightNode = [TreeNode treeFromArray:array];
    
    return root;
}

+ (NSArray *)getLevelOrderTraversal:(TreeNode *)tree {
    
    NSMutableArray *queue = [NSMutableArray arrayWithObject:tree];
    NSMutableArray *resultArray = [NSMutableArray new];
    
    while (queue.count != 0) {
        
        NSMutableArray *currentLevel = [[NSMutableArray alloc] init];
        long queueSize = queue.count;
        
        for (int i = 0; i < queueSize; i++) {

            TreeNode *node = queue.firstObject;
            [queue removeObjectAtIndex:0];
            
            [currentLevel addObject:node.value];
            
            if (node.leftNode != nil) {
                [queue addObject:node.leftNode];
            }
            if (node.rightNode != nil) {
                [queue addObject:node.rightNode];
            }
        }
        
        [resultArray addObject:[NSArray arrayWithArray:[currentLevel copy]]];
    }
    
    return [resultArray copy];
}


@end
