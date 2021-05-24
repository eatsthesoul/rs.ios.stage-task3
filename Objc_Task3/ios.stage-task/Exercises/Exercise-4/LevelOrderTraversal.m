#import "LevelOrderTraversal.h"
#import "TreeNode.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    
    TreeNode *treeNode = [TreeNode treeFromArray:[tree mutableCopy]];
    return treeNode == nil ? @[] : [TreeNode getLevelOrderTraversal:treeNode];
}
