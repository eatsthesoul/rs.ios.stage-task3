#import "DateHelper.h"
#import "NSDate+CustomDate.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    //exception handling
    if (monthNumber < 1 || monthNumber > 12) {
        return nil;
    }
    
    NSDate *date = [NSDate dateFrom:1 month:monthNumber year:2000];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MMMM";
    
    return [dateFormatter stringFromDate:date];
    
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    
    NSDate *receivedDate = [dateFormatter dateFromString:date];
    
    return [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:receivedDate];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"E";
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    
    return [dateFormatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSDateComponents *currentDateComponents = [[NSCalendar currentCalendar]
                                               components:NSCalendarUnitYear | NSCalendarUnitWeekOfYear
                                               fromDate:NSDate.now];
    
    NSDateComponents *argumentDateComponents = [[NSCalendar currentCalendar]
                                                components:NSCalendarUnitYear | NSCalendarUnitWeekOfYear
                                                fromDate:date];
    
    return (currentDateComponents.year == argumentDateComponents.year) &&
    (currentDateComponents.weekOfYear == argumentDateComponents.weekOfYear);
}

@end
