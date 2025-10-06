# 🕌 Al-Awqaf Database Management System

## 🧠 Overview
The **Al-Awqaf Database Management System** is a structured SQL-based project designed to manage and organize mosque-related operations efficiently.  
It primarily focuses on handling **Imam information**, **mosque records**, **announcements**, and **outside job assignments** — allowing the Ministry of Awqaf to manage and communicate with Imams effectively.

This project includes:
- A **fully functional SQL database schema** with constraints, relationships, and stored procedures.
- A **technical report** that documents the architecture and logic.
- A **user document** that explains system usage by different roles (Minister, Employee, Imam).

---

## ⚙️ System Components

### 🕌 Mosque Management
- Stores details about mosques including name, location (city, neighborhood, street), capacity, and housing availability.

### 👳 Imam Information
- Contains Imam data such as Social Security Number (SSN), full name, date of birth, salary, marital status, and the mosque they serve.

### 📢 Announcement Management
- Tracks all announcements sent to Imams (e.g., Jomaa sermon topics, warnings, official calls).  
- Attributes include announcement ID, date, description, and type.

### 💼 Outside Job Management
- Manages external jobs assigned to Imams with attributes such as ID, date, place, payment status, and type.

### 🧮 Views Implemented
- **Announcement_Type_View** – Displays announcements and their categories.  
- **Outside_Job_View** – Lists outside jobs with details.  
- **Emam_Announcement** – Combines Imam and announcement data.  
- **Emam_Outside_Job** – Links Imams with their job assignments.

### ⚙️ Stored Procedures
- `Insert_Mosque_With_Imam` – Inserts a mosque and Imam simultaneously.  
- `New_Announcement_To_Emam` – Adds a new announcement for a specific Imam.  
- `New_Job_To_Emam` – Registers an outside job and links it to an Imam.  
- `Update_Emam_Salary` – Updates the salary of an Imam.

### 🔒 User Management
- Role-based access:
  - **Minister** – Full CRUD access to all data.  
  - **Employee** – Limited insert, update, and view permissions.  
  - **Imam** – View-only access with limited operations via database views.  

### 🧾 Backup & Restore
- Supports **full**, **differential**, and **transaction log** backups for data integrity and disaster recovery.

---

## 👥 User Roles and Access

### 🧑‍⚖️ Minister
- Can add, update, delete, and view all mosques, imams, announcements, and jobs.  
- Has full access to the database operations.

### 🧑‍💼 Employee
- Can add and view mosque and imam data after authorization.  
- Can create or update announcements and jobs.

### 👳 Imam
- Can view their **assigned announcements** and **outside jobs**.  
- Accesses personal profile data in a read-only mode.

---

## 🧩 SQL Features Demonstrated
- **Relational schema design**
- **Primary and foreign key constraints**
- **Stored procedures and views**
- **Role-based security**
- **Data integrity and backup routines**