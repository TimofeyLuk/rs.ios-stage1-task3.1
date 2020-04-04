#import "Combinator.h"

@implementation Combinator
- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    long posterNumber = [array[0] integerValue];
    long colorsNumber = [array[1] integerValue];
    for (int n = 1; n < colorsNumber; n++) {
        long combinationsNuber = [Combinator factorial: colorsNumber] / ([Combinator factorial: n] * [Combinator factorial:(colorsNumber - n)]);
        if (posterNumber == combinationsNuber) {
            return [NSNumber numberWithInt: n];
        }
    }
    return nil;
}

+ (long)factorial:(long)n {
    if (n == 0)
        return 1;
    return n * [Combinator factorial:n-1];
}
@end
