#import "ViewController.h"

@implementation ViewController

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.accessibilityIdentifier = @"mainView";
    
    self.viewResultColor = [[UIView alloc] initWithFrame: CGRectMake(110, 110, 250, 40)];
    self.viewResultColor.backgroundColor = [UIColor grayColor];
    [self.view addSubview: self.viewResultColor];
    
    self.labelResultColor = [[UILabel alloc] initWithFrame: CGRectMake(20, 110, 150, 40)];
    [self.labelResultColor setText: @"Color"];
    [self.view addSubview: self.labelResultColor];
    
    UILabel *labelRed = [[UILabel alloc] initWithFrame: CGRectMake(20, 180, 150, 30)];
    [labelRed setText: @"RED"];
    [self.view addSubview: labelRed];
    self.textFieldRed = [[UITextField alloc] initWithFrame: CGRectMake(90, 180, 270, 30)];
    self.textFieldRed.layer.borderWidth = 0.5;
    self.textFieldRed.layer.borderColor = [UIColor grayColor].CGColor;
    self.textFieldRed.layer.cornerRadius = 5;
    [self.textFieldRed setFont:[UIFont systemFontOfSize:14]];
    self.textFieldRed.placeholder = @"0..255";
    [self.view addSubview: self.textFieldRed];
    
    UILabel *labelGreen = [[UILabel alloc] initWithFrame: CGRectMake(20, 240, 150, 30)];
    [labelGreen setText: @"GREEN"];
    [self.view addSubview: labelGreen];
    self.textFieldGreen = [[UITextField alloc] initWithFrame: CGRectMake(90, 240, 270, 30)];
    self.textFieldGreen.layer.borderWidth = 0.5;
    self.textFieldGreen.layer.borderColor = [UIColor grayColor].CGColor;
    self.textFieldGreen.layer.cornerRadius = 5;
    [self.textFieldGreen setFont:[UIFont systemFontOfSize:14]];
    self.textFieldGreen.placeholder = @"0..255";
    [self.view addSubview: self.textFieldGreen];
    
    UILabel *labelBlue = [[UILabel alloc] initWithFrame: CGRectMake(20, 300, 150, 30)];
    [labelBlue setText: @"BLUE"];
    [self.view addSubview: labelBlue];
    self.textFieldBlue = [[UITextField alloc] initWithFrame: CGRectMake(90, 300, 270, 30)];
    self.textFieldBlue.layer.borderWidth = 0.5;
    self.textFieldBlue.layer.borderColor = [UIColor grayColor].CGColor;
    self.textFieldBlue.layer.cornerRadius = 5;
    [self.textFieldBlue setFont:[UIFont systemFontOfSize:14]];
    self.textFieldBlue.placeholder = @"0..255";
    [self.view addSubview: self.textFieldBlue];
    
    
    UIButton *buttonProcess = [[UIButton alloc] initWithFrame: CGRectMake(self.view.center.x - 50, 400, 100, 30)];
    [buttonProcess setTitle:@"Process" forState: UIControlStateNormal];
    [buttonProcess setTitleColor: [[UIColor alloc] initWithRed: 0.04 green: 0.4 blue:1 alpha:0.8] forState: UIControlStateNormal];
    [buttonProcess addTarget:self action:@selector(process) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: buttonProcess];
    
    [self.textFieldRed addTarget:self action:@selector(setCollorToRes) forControlEvents: UIControlEventAllTouchEvents];
    [self.textFieldGreen addTarget:self action:@selector(setCollorToRes) forControlEvents: UIControlEventAllTouchEvents];
    [self.textFieldBlue addTarget:self action:@selector(setCollorToRes) forControlEvents: UIControlEventAllTouchEvents];
    
    self.view.accessibilityIdentifier = @"mainView";
    self.textFieldRed.accessibilityIdentifier = @"textFieldRed";
    self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    buttonProcess.accessibilityIdentifier = @"buttonProcess";
    labelRed.accessibilityIdentifier = @"labelRed";
    labelGreen.accessibilityIdentifier = @"labelGreen";
    labelBlue.accessibilityIdentifier = @"labelBlue";
    self.labelResultColor.accessibilityIdentifier = @"labelResultColor";
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";
    
}


- (void) setCollorToRes {
    [self.labelResultColor setText: @"Color"];
}

- (NSString *)hexStringForColor:(UIColor *)color {
      const CGFloat *components = CGColorGetComponents(color.CGColor);
      CGFloat r = components[0];
      CGFloat g = components[1];
      CGFloat b = components[2];
      NSString *hexString=[NSString stringWithFormat:@"%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
      return  [@"0x" stringByAppendingString: hexString];
}

-(void) process {
    
    int red = self.textFieldRed.text.intValue;
    int green = self.textFieldGreen.text.intValue;
    int blue = self.textFieldBlue.text.intValue;
    bool notOnlyNumersInStr = ![[NSString stringWithFormat:@"%d",red] isEqualToString: self.textFieldRed.text] || ![[NSString stringWithFormat:@"%d",green] isEqualToString: self.textFieldGreen.text] || ![[NSString stringWithFormat:@"%d",blue] isEqualToString: self.textFieldBlue.text];
    if (red < 1 || green < 1 || blue < 1 || red > 255 || green > 255 || blue > 255 || notOnlyNumersInStr)
    {
        [self.labelResultColor setText: @"Error"];
        return;
    }
    UIColor *color = [UIColor colorWithRed:red / 255.0f
    green:green / 255.0f
    blue:blue / 255.0f
    alpha:1.0f];
    self.viewResultColor.backgroundColor = color;
    [self.labelResultColor setText: [self hexStringForColor: self.viewResultColor.backgroundColor]];
    self.textFieldRed.text = @"";
    self.textFieldGreen.text = @"";
    self.textFieldBlue.text = @"";
}

@end
