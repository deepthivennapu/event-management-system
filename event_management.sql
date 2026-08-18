-- Event Management System - Oracle SQL
-- DBMS: Oracle Database

-- 1. ORGANIZER
CREATE TABLE ORGANIZER (
    Organizer_ID NUMBER(10) PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100),
    Phone VARCHAR2(20)
);

-- 2. CATEGORY
CREATE TABLE CATEGORY (
    Category_ID NUMBER(10) PRIMARY KEY,
    Category_Name VARCHAR2(100) NOT NULL,
    Description VARCHAR2(255)
);

-- 3. VENUE
CREATE TABLE VENUE (
    Venue_ID NUMBER(10) PRIMARY KEY,
    Venue_Name VARCHAR2(100) NOT NULL,
    Location VARCHAR2(255),
    Capacity NUMBER(10)
);

-- 4. PARTICIPANT
CREATE TABLE PARTICIPANT (
    Participant_ID NUMBER(10) PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100),
    Phone VARCHAR2(20)
);

-- 5. EVENT
CREATE TABLE EVENT (
    Event_ID NUMBER(10) PRIMARY KEY,
    Event_Name VARCHAR2(150) NOT NULL,
    Date DATE NOT NULL,
    Time VARCHAR2(5),
    Organizer_ID NUMBER(10) NOT NULL,
    Venue_ID NUMBER(10) NOT NULL,
    Category_ID NUMBER(10) NOT NULL,
    CONSTRAINT fk_event_organizer
        FOREIGN KEY (Organizer_ID) REFERENCES ORGANIZER(Organizer_ID),
    CONSTRAINT fk_event_venue
        FOREIGN KEY (Venue_ID) REFERENCES VENUE(Venue_ID),
    CONSTRAINT fk_event_category
        FOREIGN KEY (Category_ID) REFERENCES CATEGORY(Category_ID)
);

-- 6. REGISTRATION
CREATE TABLE REGISTRATION (
    Registration_ID NUMBER(10) PRIMARY KEY,
    Participant_ID NUMBER(10) NOT NULL,
    Event_ID NUMBER(10) NOT NULL,
    Registration_Date DATE,
    Status VARCHAR2(30),
    CONSTRAINT fk_registration_participant
        FOREIGN KEY (Participant_ID) REFERENCES PARTICIPANT(Participant_ID),
    CONSTRAINT fk_registration_event
        FOREIGN KEY (Event_ID) REFERENCES EVENT(Event_ID)
);

-- 7. PAYMENT
CREATE TABLE PAYMENT (
    Payment_ID NUMBER(10) PRIMARY KEY,
    Registration_ID NUMBER(10) NOT NULL UNIQUE,
    Amount NUMBER(10,2),
    Payment_Date DATE,
    Payment_Status VARCHAR2(30),
    CONSTRAINT fk_payment_registration
        FOREIGN KEY (Registration_ID) REFERENCES REGISTRATION(Registration_ID)
);

-- End of Event Management System schema
