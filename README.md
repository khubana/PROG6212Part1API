RaceDay System
1. Project Overview
RaceDay is a web-based race and event management system designed to allow organisers to create and manage sporting events while allowing participants to register, view available events, enrol in race categories, and view their results.
The system is planned using a relational database and a RESTful API. Before application development begins, the database structure, Entity Relationship Diagram (ERD), API endpoints, role-based access requirements, SQL database script, and CI/CD repository validation have been defined.
The purpose of this Part 1 is to demonstrate the complete planning and database design of the RaceDay system before API development begins.

2. System Objectives
The RaceDay system aims to:
⦁	Allow users to register and log into the system.
⦁	Support role-based access for Organisers and Participants.
⦁	Allow Organisers to create and manage race events.
⦁	Allow Organisers to create categories for their events.
⦁	Allow Participants to view available events.
⦁	Allow Participants to enrol in event categories.
⦁	Allow Organisers to record race results.
⦁	Allow Participants to view their race results.
⦁	Store RaceDay information securely in a relational SQL Server database.
⦁	Provide a structured RESTful API for communication between the application and database.

3. System Roles
RaceDay has two main roles.
3.1 Organiser
An Organiser is responsible for managing race events.
An Organiser can:
⦁	Register and log into the system.
⦁	Manage their profile.
⦁	Create events.
⦁	Update events.
⦁	Delete events.
⦁	Create event categories.
⦁	Update categories.
⦁	Delete categories.
⦁	View participants enrolled in their events.
⦁	Record race results.
⦁	Update race results.
⦁	Delete incorrect results.
3.2 Participant
A Participant is a user who takes part in RaceDay events.
A Participant can:
⦁	Register and log into the system.
⦁	Manage their profile.
⦁	View available events.
⦁	View event details.
⦁	View event categories.
⦁	Enrol in an event.
⦁	View their enrolments.
⦁	Cancel an enrolment.
⦁	View their race results.

4. Database Design
The RaceDay database is designed as a relational SQL Server database.
The database contains the following entities:
⦁	Roles
⦁	Users
⦁	Events
⦁	Categories
⦁	EventEnrolments
⦁	Results
Main Relationships
⦁	One Role can be assigned to many Users.
⦁	One Organiser can create many Events.
⦁	One Event can contain many Categories.
⦁	One Participant can have many EventEnrolments.
⦁	One Event can have many EventEnrolments.
⦁	One Category can have many EventEnrolments.
⦁	One EventEnrolment can have zero or one Result.
The EventEnrolments entity resolves the many-to-many relationship between Participants and Events.

5. Entity Relationship Diagram
The ERD is available in the /docs folder.
docs/
└── RaceDay_ERD.png

The ERD identifies:
⦁	Primary keys (PK)
⦁	Foreign keys (FK)
⦁	Entity attributes
⦁	One-to-many relationships
⦁	Many-to-many relationship resolution
⦁	Relationship cardinality
The ERD has been designed to match the SQL Server database script.

6. API Endpoint Plan
The planned RESTful API endpoints are documented in:
docs/
└── API_Endpoint_Plan.md

The API plan covers:
⦁	Authentication
⦁	User profiles
⦁	Events
⦁	Categories
⦁	Event enrolments
⦁	Results
Each endpoint specifies:
⦁	HTTP method
⦁	Route
⦁	Description
⦁	Required role
⦁	Request body
⦁	Expected response
⦁	Relevant HTTP error codes
The API plan is intended to guide the implementation of Part 2.

7. SQL Database Script
The SQL Server database script is located at:
docs/
└── RaceDay_Database.sql

The script includes:
⦁	Database creation
⦁	Table creation
⦁	Primary keys
⦁	Foreign keys
⦁	NOT NULL constraints
⦁	UNIQUE constraints
⦁	DEFAULT constraints
⦁	CHECK constraints
⦁	Sample data
⦁	Test queries
⦁	JOIN queries
Seed Data
The database contains the minimum required sample data:
⦁	2 Organisers
⦁	2 Participants
⦁	3 Events
⦁	8 Event Categories
⦁	4 Event Enrolments
⦁	2 Results
The SQL script is designed to run in Microsoft SQL Server Man

8. Repository Structure
The repository follows the required structure:
RaceDay/
│
├── docs/
│   ├── RaceDay_ERD.png
│   ├── API_Endpoint_Plan.md
│   └── RaceDay_Database.sql
│
├── .github/
│   └── workflows/
│       └── validate-docs.yml
│
└── README.md


9. CI/CD – GitHub Actions
GitHub Actions is used to validate the required repository structure.
The workflow checks that:
⦁	The /docs folder exists.
⦁	The ERD file exists.
⦁	The API endpoint plan exists.
⦁	The SQL database script exists.
⦁	The README file exists.
The workflow is located at:
.github/workflows/validate-docs.yml

Successful CI/CD Build
Add a screenshot of your successful green GitHub Actions build below.
[INSERT YOUR GREEN BUILD SCREENSHOT HERE]

Example:
GitHub Actions
✓ Validate RaceDay Documentation
✓ Check docs folder
✓ Check ERD
✓ Check API Endpoint Plan
✓ Check SQL Script


10. Testing the SQL Database
The SQL database will be tested using Microsoft SQL Server Management Studio (SSMS).
Testing includes:
⦁	Creating the RaceDay database.
⦁	Creating all required tables.
⦁	Creating primary and foreign key relationships.
⦁	Inserting sample data.
⦁	Checking the inserted records.
⦁	Testing relationships using JOIN queries.
⦁	Confirming that database constraints work correctly.
⦁	Confirming that the script can execute successfully on a clean SQL Server instance.

11. GitHub Commit Requirement
A minimum of 20 meaningful commits will be made for Part 1.
Examples of meaningful commits include:
docs: create project documentation structure
docs: add RaceDay system overview
docs: add RaceDay business rules
docs: create initial ERD
docs: update ERD relationships
docs: add primary and foreign keys to ERD
docs: finalise ERD cardinality
docs: create API endpoint plan
docs: add authentication endpoints
docs: add user profile endpoints
docs: add event endpoints
docs: add category endpoints
docs: add enrolment endpoints
docs: add result endpoints
database: create Roles table
database: create Users table
database: create Events table
database: create Categories table
database: create EventEnrolments table
database: create Results table
database: add RaceDay seed data
ci: add GitHub Actions validation workflow
docs: update README

Each commit should represent a meaningful change rather than making multiple empty or insignificant commits.

12. Technologies
The planned technologies for the RaceDay system include:
⦁	Microsoft SQL Server – relational database
⦁	SQL Server Management Studio (SSMS) – database development and testing
⦁	RESTful API – system communication
⦁	GitHub – source-code and documentation repository
⦁	GitHub Actions – CI/CD validation

13. Documentation
All required Part 1 planning documents are stored in the /docs directory.
Document	Location
ERD	/docs/RaceDay_ERD.png
API Endpoint Plan	/docs/API_Endpoint_Plan.md
SQL Database Script	/docs/RaceDay_Database.sql

14. YouTube Walkthrough
An unlisted YouTube video will be provided demonstrating the RaceDay planning work.
The video will explain:
⦁	The purpose of the RaceDay system.
⦁	The two system roles.
⦁	The ERD and its business rules.
⦁	Primary and foreign keys.
⦁	Relationship cardinality.
⦁	The API endpoint planning decisions.
⦁	The SQL database structure.
⦁	The sample data.
⦁	Running the SQL script in SSMS.
⦁	The successful database queries.
⦁	The GitHub repository and CI/CD workflow.
YouTube Link[https://youtu.be/9cuS2KCQqs8]
  

15. Conclusion
The RaceDay Part 1 planning phase establishes the foundation for the development of the system. The ERD defines the database entities and relationships, while the API endpoint plan defines how the application will communicate with the system. The SQL Server script implements the planned database structure and provides realistic sample data for testing.
