Product Summary: PaniUndo

PaniUndo is an AI-powered, multilingual hiring platform designed for blue-collar and low-literacy workers. It helps workers create job-ready profiles without typing, resumes, or complex forms. A worker simply records or uploads a short video/audio introduction in their preferred language, and PaniUndo’s AI extracts their skills, experience, location, availability, and job preferences to generate a clean digital profile.

For employers, PaniUndo provides a dashboard where they can post jobs, view AI-matched candidates, screen applicants, watch/listen to worker introductions, and shortlist the most suitable people. The platform also supports a shared workforce model, allowing workers to take part-time or shift-based roles across multiple shops or businesses when their schedules match.

The goal of PaniUndo is to bridge the gap between informal workers and employers by making hiring more accessible, faster, and fairer.

One-Line Pitch

PaniUndo helps blue-collar workers get hired by simply speaking, while employers get AI-matched, easy-to-screen candidates.

Core Features for Flutter App

Since you want Flutter for both Web and Android, build one shared codebase with two main experiences:

Worker Side
Language selection
Record/upload video introduction
AI transcript generation
AI-generated worker profile
Resume/profile card
Recommended jobs
Apply button
Availability toggle for part-time/shared work
Employer Side
Employer login/demo access
Post job form
View matched candidates
Match score
Candidate profile cards
Video/audio intro preview
Shortlist/contact button
Recommended Hackathon Build

Use Flutter as the frontend for both:

Flutter Android App
Flutter Web App
        |
        v
Backend API
        |
        v
AI Pipeline + Database + Storage

Suggested stack:

Frontend: Flutter
Backend: FastAPI or Firebase Functions
Database: Firebase Firestore / Supabase
Storage: Firebase Storage / Supabase Storage
AI: Speech-to-text + LLM profile extraction
Deployment: Firebase Hosting / Vercel for web
Product Description for Pitch Deck

PaniUndo is a multilingual AI hiring platform for India’s blue-collar workforce. Workers can record a short video or voice introduction, and the system automatically creates a structured resume-like profile by extracting their skills, experience, availability, and job preferences. Employers can post jobs, screen candidates through an easy dashboard, view AI-generated match scores, and shortlist workers faster.

Unlike traditional job portals that require typing, reading, and formal resumes, PaniUndo is built for workers who may have limited literacy or digital experience. Its voice/video-first flow makes employment access simple, inclusive, and scalable.
