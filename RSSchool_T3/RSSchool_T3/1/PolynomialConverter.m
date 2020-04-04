#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    if ([numbers count] == 0) {
       return nil;
    }
    NSString *res = @"";
    int index = -1;
    for (NSNumber *el in numbers) {
        index += 1;
        if (el.integerValue == 0) {
            continue;
        }
        NSString *operatorCharacter = el.integerValue < 0 ? @" - " : @" + ";
        operatorCharacter = index != 0 ? operatorCharacter : @"";
        int value =  abs([el intValue]);
        NSString *str = value != 1 ? [NSString stringWithFormat:@"%dx", value] : @"x";
        str = index < [numbers count] - 1 ? str :[NSString stringWithFormat:@"%d", value];
        str = [operatorCharacter stringByAppendingString: str];
        if ([numbers count] - 1 - index > 1 && value > 1) {
            str = [str stringByAppendingString: [NSString stringWithFormat:@"^%d", [numbers count] - 1 - [numbers indexOfObject: el]]];
        }
        
        res = [res stringByAppendingString: str];
    }
    return res;
}
@end
