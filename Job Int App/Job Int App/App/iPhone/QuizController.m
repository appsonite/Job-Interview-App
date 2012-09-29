

#import "QuizController.h"
#import "PointSystemManager.h"

#define TAG_INDEX_RADIOBUTTON   100
#define TAG_INDEX_LABEL         200
#define NUMOFANSWER             4
#define TAG_INDEX_QUESTION      80
@interface QuizController ()

@end

@implementation QuizController

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}


-(void) viewDidLoad
{

    [self getQuizData];
    answerList = [[NSMutableArray alloc] initWithCapacity:1];
    [super viewDidLoad];
    self.title = @"Quiz";
}
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    viewResult.hidden   = TRUE;
    viewQuestion.hidden = FALSE;
    currentSelectedQuestion = 0;
    [answerList removeAllObjects];
    [self resetView: currentSelectedQuestion];
}
-(void) viewDidUnload
{
    [super viewDidUnload];
    [quizData release];
    [answerList release];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void) getQuizData
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Quiz" ofType:@"plist"];
    quizData = [[NSDictionary dictionaryWithContentsOfFile: filePath] retain];
}

-(void) resetView:(int) nIndexQuestion
{
   
    // reload datas;
    NSArray *arrData = [quizData objectForKey:@"QuizList"];
    NSDictionary *dic = [arrData objectAtIndex:nIndexQuestion];
    NSString *question = [ dic objectForKey:@"question"];
    
    UILabel *lblQuestion = (UILabel*) [viewQuestion viewWithTag:TAG_INDEX_QUESTION];
    lblQuestion.text = question;
    
    float y = 130;
    float hSpace = 13;
    float fontSize = 15.0f;
    if ( [[UIDevice currentDevice] userInterfaceIdiom ] == UIUserInterfaceIdiomPad)
    {
        y = 319;
        hSpace = 40;
        fontSize = 21.0f;
    }
    for (int i =0; i<NUMOFANSWER; i++)
    {
        UIButton *temp = (UIButton*) [viewQuestion viewWithTag:i+TAG_INDEX_RADIOBUTTON];
        if ( i == 0) 
            [temp setSelected:TRUE];
        else
            [temp setSelected:FALSE];
        NSArray *arr = [dic objectForKey:@"answer"];
        NSString *str = [arr objectAtIndex:i];
        UILabel *templ = (UILabel*) [viewQuestion viewWithTag:i+TAG_INDEX_LABEL];
        // rearrange with text size;
        templ.text = str;
        CGRect cgtemp = templ.frame;
        cgtemp.size = CGSizeMake(cgtemp.size.width, 500);
        // estimate height
        CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize: cgtemp.size lineBreakMode:UILineBreakModeWordWrap];
        cgtemp.size.height = size.height;
        cgtemp.origin.y = y;
        templ.frame = cgtemp;
        
        cgtemp = temp.frame;
        cgtemp.origin.y = y + size.height/2 - cgtemp.size.height/2;
        temp.frame = cgtemp;
        
        y +=size.height+hSpace;
        
    }
    lblQuestionN.text = [NSString stringWithFormat:@"%d/%d", nIndexQuestion+1, 20];
}

-(void) showResult
{
    //  calc right wrong
    int n = 0;
    for ( int index = 0; index < [answerList count]; index++)
    {
        NSNumber *num = (NSNumber*) [answerList objectAtIndex:index];
        NSArray *arrData = [quizData objectForKey:@"QuizList"];
        NSDictionary *dic = [arrData objectAtIndex:index];
        int valRight = [[dic objectForKey:@"right_answer"] intValue];
        if ( valRight == [num intValue] )
        {
            n++;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"addpoint" object:[NSNumber numberWithInt:POINT_ADD_QUIZ_1+index]];
        }
    }
    lblRight.text = [NSString stringWithFormat:@"%d", n];
    lblWrong.text = [NSString stringWithFormat:@"%d", 20-n];
    [tblResult reloadData];
}

-(IBAction) actionChecked:(id)sender
{
    UIButton *btn = (UIButton*) sender;
    int tag = btn.tag;
    
    for (int i =0; i<NUMOFANSWER; i++)
    {
        UIButton *temp = (UIButton*) [viewQuestion viewWithTag: TAG_INDEX_RADIOBUTTON + i];
        if ( i + TAG_INDEX_RADIOBUTTON == tag)
            [temp setSelected:TRUE];
        else {
            [temp setSelected:FALSE];
        }
    }
}

-(IBAction) actionPrev:(id)sender
{
    currentSelectedQuestion--;
    if (currentSelectedQuestion == 0)
        btnPrev.hidden = TRUE;
    [self resetView:currentSelectedQuestion];
    
}

-(IBAction) actionNext:(id)sender
{
    // save the answer
    int n1 = 0;
    for (int i =0; i<NUMOFANSWER; i++)
    {
        UIButton *temp = (UIButton*) [viewQuestion viewWithTag: TAG_INDEX_RADIOBUTTON+i];
        if ( temp.isSelected == TRUE ){
            n1 = i+1;
        }
    }
    if ([answerList count]<=currentSelectedQuestion)
    {
        [answerList addObject:[NSNumber numberWithInt:n1]];
    }
    else {
        [answerList replaceObjectAtIndex:currentSelectedQuestion withObject:[NSNumber numberWithInt:n1]];
    }
    currentSelectedQuestion++;
    if (currentSelectedQuestion == 20)
    {
        //
        //currentSelectedQuestion--;
        viewQuestion.hidden = TRUE;
        viewResult.hidden = FALSE;
        // show result;
        [self showResult];
        return;
    }
    [self resetView:currentSelectedQuestion];
    if (currentSelectedQuestion == 1)
        btnPrev.hidden = FALSE;
}

#pragma mark -- table result deletate


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    if (viewResult.isHidden == FALSE)
        return 1;
    else
        return 0;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (viewResult.isHidden == FALSE)
        return 20;
    else
        return 0;
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad )
    {
        return 90;
    }
    return 40;
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdeintifier = @"default";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdeintifier];
    
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdeintifier] autorelease];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Question %d", indexPath.row+1];
    NSNumber *num = (NSNumber*) [answerList objectAtIndex:indexPath.row];
    NSArray *arrData = [quizData objectForKey:@"QuizList"];
    NSDictionary *dic = [arrData objectAtIndex:indexPath.row];
    int valRight = [[dic objectForKey:@"right_answer"] intValue];
    if ( valRight == [num intValue] )
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    NSArray *arr = [NSArray arrayWithObjects:@"A",@"B",@"C", @"D", nil];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"    Right Answer is %@", [arr objectAtIndex:(valRight-1)]];
    [cell.detailTextLabel setTextColor:[UIColor brownColor ]];
    
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad )
    {
        [cell.textLabel setFont: [UIFont systemFontOfSize:22.0]];
        [cell.detailTextLabel setFont: [UIFont systemFontOfSize:19.0]];
    }
    else {
        [cell.textLabel setFont: [UIFont systemFontOfSize:14.0]];
        [cell.detailTextLabel setFont: [UIFont systemFontOfSize:12.0]];        
    }
    return cell;
}
@end
