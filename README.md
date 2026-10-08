# ATSPROJECT
Module 6
Feature:Application Tracking System (ATS) 
Scenario:Check Application Status
Given Candidate Login
And Candidate Submitted Job Application
When Open Page
Then System Display Jon Application

Feature:Application Update
Scenario:Candidate Application Status
Given Candidate Submitted Application
And recruiter status "Interview"
When Candidate login and view Application
Then they should see status "Interview"