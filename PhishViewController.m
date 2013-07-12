#import "PhishViewController.h"
#import "PhishNewsViewController.h"

@interface PhishViewController ()

@end

@implementation PhishViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// here we create an API instance using initWithMethod
	// 'pnet.news.get' has no arguments so we pass no arguments
	// the method requires no API key so keyed:NO
	// sender is the delegate, in this case it's this class(self)
	
    localAPI = [[PhishAPI alloc] initWithMethod:@"pnet.news.get" arguments:@"" keyed:NO sender:self];
	
	// fetchData will start the process of getting our JSON from the API
	
    [localAPI fetchData];
}

// required by PhishAPIDelegate protocol
- (void)gotData:(NSData *)dat method:(NSString *)method
{
    NSLog(@"SUCCESS");
    NSError *e = nil;
    json = [NSJSONSerialization JSONObjectWithData:dat options: NSJSONReadingMutableContainers error:&e];

	// the variable json is now either a dictionary or an array, whichever mimics the response
	// from the API.  this also returns what method was sent to make it easier to determine what
	// format the response came in(array or dictionary)
    
    localAPI = nil;
}

// required by PhishAPIDelegate protocol
- (void)connFailed:(NSError *)err;
{
    NSLog(@"ERROR");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
