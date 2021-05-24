#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableString *commonString = [[NSMutableString alloc] initWithString:@""];
    NSMutableString *mutableString1 = [[NSMutableString alloc] initWithString:string1];
    NSMutableString *mutableString2 = [[NSMutableString alloc] initWithString:string2];
    
    //add chars to the common string until one of the mutable strings become empty
    while (mutableString1.length != 0 && mutableString2.length != 0) {
        
        if (mutableString1.UTF8String[0] <= mutableString2.UTF8String[0]) {
            
            [commonString appendFormat:@"%c", [mutableString1 characterAtIndex:0]];
            [mutableString1 deleteCharactersInRange: NSMakeRange(0, 1)];
            
        } else {
            
            [commonString appendFormat:@"%c", [mutableString2 characterAtIndex:0]];
            [mutableString2 deleteCharactersInRange: NSMakeRange(0, 1)];
        }
    }
    
    //add the remaining string to the common string
    mutableString1.length == 0 ? [commonString appendString:mutableString2] : [commonString appendString:mutableString1];
    
    return commonString;
}

@end
