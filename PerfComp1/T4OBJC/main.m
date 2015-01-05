//
//  main.m
//  T4OBJC
//
//  Created by Hoon H. on 2015/01/05.
//
//

#import <Foundation/Foundation.h>

@interface	Test1: NSObject
@end
@implementation Test1
{
@public
	unichar		value;
}
- (instancetype)init:(unichar)value1 {
	if (self = [super init]) {
		self->value	=	value1;
	}
	return	self;
}
@end



int main(int argc, const char * argv[]) {
	NSUInteger const	N	=	1024 * 1024 * 4;
	@autoreleasepool {
		NSArray*	a	=	@[
							  [[Test1 alloc] init:'A'],
							  [[Test1 alloc] init:'B'],
							  [[Test1 alloc] init:'C'],
							  [[Test1 alloc] init:'D'],
							  ];
		
		NSMutableData*	d	=	[[NSMutableData alloc] initWithCapacity:N * sizeof(unichar)];
		for (NSUInteger i=0; i<N; i++) {
			for (Test1* t in a) {
				unichar const	ch1	=	t->value;
				[d appendBytes:&ch1 length:sizeof(unichar)];
			}
		}
		
		NSString*	s	=	[[NSString alloc] initWithData:d encoding:NSUTF16StringEncoding];
		
		NSLog(@"utf16 length: %@", @([s length]));
		NSLog(@"%@", [s substringFromIndex:[s length]-1]);
	}
	return 0;
}
