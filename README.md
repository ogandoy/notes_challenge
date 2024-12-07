# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# Project setup

This document explains how to setup a development environment to work with NotesChallenge.

### Prerequisites

- Ruby >= 3.2.6
- Rails: = 7.1.5
- Postgres: 14
- TailwindCss

### Considerations for Developing the Application

1.⁠ ⁠Mandatory Authentication:
  - All users must log in to access the application.

2.⁠ ⁠User Roles:
  - Admin:
     - Can perform CRUD (Create, Read, Update, Delete) operations exclusively on your own notes. The ability to create notes for other users was not considered, as the application is intended to function more like a personal notes platform rather than a blog.

     - Manages user roles.

   - Reader:
     - Can only view all notes.

3.⁠ ⁠Dashboard:
   - Accessible only to users with role admin, because users should only access information and functionality necessary for their role. READER users don’t need dashboard access as their purpose is limited to viewing notes.

I didn’t implement pagination, but I know I should have. I realized it after everything was already completed.
