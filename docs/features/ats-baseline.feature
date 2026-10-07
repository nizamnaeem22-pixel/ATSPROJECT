@baseline
Feature: ATS baseline functionality
  Initial acceptance criteria for candidate application tracking.
  Story point estimates are Fibonacci estimates for each complete story.
  Scenario point estimates size the individual acceptance scenarios and are
  informational; they are not summed to derive the story estimate.

  @ATS-001 @story_points_5
  Rule: Candidates can submit an application
    As a candidate
    I want to submit my details and resume for a job
    So that the employer can consider my application

    @scenario_points_3
    Scenario: Submit a complete application
      Given an open job accepts applications
      And I have provided my name, email address, and resume
      When I submit an application for that job
      Then the application is saved against the job
      And I see a confirmation with an application reference

    @scenario_points_2
    Scenario: Reject an application missing required information
      Given an open job accepts applications
      And I have not provided a required application field
      When I submit an application for that job
      Then the application is not saved
      And I am told which required information is missing

  @ATS-002 @story_points_5
  Rule: Recruiters can review and progress applications
    As a recruiter
    I want to review applications and update their stages
    So that I can manage candidates through the hiring process

    @scenario_points_2
    Scenario: View applications for a job
      Given I am an authenticated recruiter for a job
      And candidates have applied to that job
      When I open the job's application list
      Then I see each candidate's name, submission date, and current stage

    @scenario_points_3
    Scenario: Move an application to another stage with an internal note
      Given I am an authenticated recruiter for a job
      And an application is in the "Submitted" stage
      When I move it to the "Screening" stage with an internal note
      Then the application stage is updated to "Screening"
      And the note is visible to authorized recruiters

  @ATS-003 @story_points_3
  Rule: Candidates can track their application status
    As a candidate
    I want to see the status of my application
    So that I know where it stands in the hiring process

    @scenario_points_2
    Scenario: View the latest application status
      Given I am signed in as the candidate who owns an application
      And the application has a current stage
      When I view my application
      Then I see its latest stage and last-updated date

    @scenario_points_1
    Scenario: Keep recruiter-only notes private
      Given an application has an internal recruiter note
      When its candidate views the application
      Then the candidate cannot see the internal note

  @ATS-004 @story_points_5
  Rule: Recruiters can schedule candidate interviews
    As a recruiter
    I want to schedule an interview for an application
    So that the candidate and interviewers know when to meet

    @scenario_points_3
    Scenario: Schedule an interview and notify the candidate
      Given I am an authenticated recruiter for an application
      And the candidate has an email address
      When I schedule an interview with a date, time, and meeting details
      Then the interview is added to the application
      And the candidate receives the interview details

    @scenario_points_2
    Scenario: Require complete interview details
      Given I am scheduling an interview for an application
      When I omit the date or time
      Then the interview is not scheduled
      And I am told which interview details are required