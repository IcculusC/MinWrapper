#import <UIKit/UIKit.h>
#import "PhishAPI.h"

@interface PhishViewController : UIViewController <PhishAPIDelegate>
{
    PhishAPI * localAPI;
    NSArray * json;
}

@end