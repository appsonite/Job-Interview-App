//
//  VideosTitles.m
//  Job Int App
//
//  Created by Viktor on 05.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "VideosTitles.h"

static  NSArray * titles;
static  NSArray * prepTitles;

@implementation VideosTitles

+(NSString*) getTitleByIndex:(int) index
{
	if(!titles)
		{
		titles = [[NSArray arrayWithObjects:@"Tell me about your education",@"Tell me about your grades",@"Extracurricular activities",@"Your previous experience",@"Tasks and responsibilities",@"Which tasks did you dislike",@"Best quality?",@"Weaknesses?",@"Improvement of weaknesses?",@"Large workloads?",@"Pressure and deadlines?",@"Stress?",@"Reaction under stress?",@"Satisfaction with career?",@"Successful accomplishment?",@"Failures?",@"Career challenges?",@"Career goals?",@"Team work?",@"Role in team work?",@"Best manager?",@"Best attribute?",@"Why work here?",@"Attractiveness of position?",@"About you?",@"Describe yourself?",@"Friends perception of you?",@"Coworkers perception of you?",@"Three strengths?",@"Three weaknesses?",@"Motivation?",@"Demotivation?",@"Leader?",@"Leadership?",@"Difficult decisions?",@"Creativity?",@"Presentations?",@"Knowledge of company?",@"Why you fit for position?",@"Important attributes in job?",@"Why hire you?",@"Why leave current job?",@"Expectations of this job?",@"Your contribution to enviroment?",@"Your expectation of supervisor?",@"Salary?",@"Salary motivator?", nil] retain];
		}
	if(index <[titles count])
		return [titles objectAtIndex:index]; 
	else return @"";
}

+(NSString*) getPrepTitleByIndex:(int)index
{
	if (!prepTitles) {
		prepTitles = [[NSArray arrayWithObjects:@"Introduction",@"Research the company",@"How to dress for the interview",@"Know where you are going",@"Date and time",@"Review your resume", nil]retain];
	}
	if (index < [prepTitles count]) 
		return [prepTitles objectAtIndex:index];
	else return @"";
	
}
@end
