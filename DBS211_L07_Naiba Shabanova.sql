-- ********************************************************************************************************************
-- Name: [Naiba Shabanova]
-- ID: [164598229]
-- Date: [04.13.2024]
-- Purpose: Project 
-- ********************************************************************************************************************
--  I Created Account Table
CREATE TABLE Account (
    account_id INT NOT NULL,
    account_name VARCHAR2(64) NOT NULL,
    account_plan_char VARCHAR2(64) NOT NULL,
    start_date DATE NOT NULL,
    status VARCHAR2(64) NOT NULL,
    CONSTRAINT Account_PK PRIMARY KEY (account_id)
);

-- I  Created Users Table
CREATE TABLE Users (
    email VARCHAR2(128) NOT NULL,
    username VARCHAR2(64) NOT NULL,
    first_name VARCHAR2(64) NOT NULL,
    last_name VARCHAR2(64),
    account_id INT NOT NULL,
    role VARCHAR2(64) NOT NULL,
    CONSTRAINT Users_PK PRIMARY KEY (email),
    CONSTRAINT Users_Account_FK FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

--  I Created Ads_Accounts Table
CREATE TABLE Ads_Accounts (
    ad_account_id INT NOT NULL,
    account_id INT NOT NULL,
    platform VARCHAR2(64) NOT NULL,
    access_token VARCHAR2(512) NOT NULL,
    access_due_date DATE NOT NULL,
    CONSTRAINT Ads_Accounts_PK PRIMARY KEY (ad_account_id),
    CONSTRAINT Ads_Accounts_Account_FK FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

--  I Created Campaigns Table
CREATE TABLE Campaigns (
    campaign_id INT NOT NULL,
    ad_account_id INT NOT NULL,
    campaign_type VARCHAR2(64) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    daily_budget NUMBER(10,2),
    total_budget NUMBER(10,2),
    spent NUMBER(10,2),
    CONSTRAINT Campaigns_PK PRIMARY KEY (campaign_id),
    CONSTRAINT Campaigns_Ad_Account_FK FOREIGN KEY (ad_account_id) REFERENCES Ads_Accounts(ad_account_id)
);

--  I Created Ads Table
CREATE TABLE Ads (
    ad_id INT NOT NULL,
    campaign_id INT NOT NULL,
    ad_type VARCHAR2(64) NOT NULL,
    creative_link VARCHAR2(512) NOT NULL,
    CONSTRAINT Ads_PK PRIMARY KEY (ad_id),
    CONSTRAINT Ads_Campaigns_FK FOREIGN KEY (campaign_id) REFERENCES Campaigns(campaign_id)
);



--  I Created Billing
CREATE TABLE Billing (
    account_id INT NOT NULL,
    billing_date DATE NOT NULL,
    plan VARCHAR2(64) NOT NULL,
    payment_method VARCHAR2(64) NOT NULL,
    status VARCHAR2(64) NOT NULL,
    sub_total NUMBER(10,2) NOT NULL,
    taxes NUMBER(10,2) NOT NULL,
    CONSTRAINT Billing_pk PRIMARY KEY (account_id, billing_date),
    CONSTRAINT Billing_account_fk FOREIGN KEY (account_id) REFERENCES Account(account_id)
);



--  I Created Reports Table
CREATE TABLE Reports (
    report_id INT NOT NULL,
    account_id INT NOT NULL,
    ad_account_id INT NOT NULL,
    last_update_date DATE NOT NULL,
    campaign_id INT NOT NULL,
    document_link VARCHAR2(512) NOT NULL,
    CONSTRAINT Reports_PK PRIMARY KEY (report_id),
    CONSTRAINT Reports_Account_FK FOREIGN KEY (account_id) REFERENCES Account(account_id),
    CONSTRAINT Reports_Ad_Account_FK FOREIGN KEY (ad_account_id) REFERENCES Ads_Accounts(ad_account_id),
    CONSTRAINT Reports_Campaigns_FK FOREIGN KEY (campaign_id) REFERENCES Campaigns(campaign_id)
);
-- ********************************************************************************************************************

-- ********************************************************************************************************************



--1.I inserted data into the Account table to represent different types of accounts, one active and one inactive.

INSERT INTO Account (account_id, account_name, account_plan_char, start_date, status) VALUES 
(1, 'XYZ Corp Ad Account', 'Enterprise', TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'Active');

--2.I inserted data into the Users table to represent users with different roles associated with these accounts.
INSERT INTO Account (account_id, account_name, account_plan_char, start_date, status) VALUES 
(2, 'XYZ Corp Ad Account', 'Enterprise', TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'Active');

-- 3.I inserted data into the Ads_Accounts table to reflect different advertising platforms and their access tokens, with varying expiration dates.
INSERT INTO Ads_Accounts (ad_account_id, account_id, platform, access_token, access_due_date) VALUES 
(101, 1, 'Facebook', 'EAAGm0PX4ZCpsBAKOlZBZCZA', TO_DATE('2025-01-01', 'YYYY-MM-DD'));

-- 4.I inserted data into the Campaigns table, showcasing different types of campaigns, budgets, and durations, with some campaigns currently running and others that have ended.

INSERT INTO Campaigns (campaign_id, ad_account_id, campaign_type, start_date, end_date, daily_budget, total_budget, spent) VALUES 
(201, 101, 'Lead Generation', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-31', 'YYYY-MM-DD'), 500, 15500, 4820);



-- 5.I inserted data into the Ads table, which holds information about individual ads, including their type and a link to their creative content.


INSERT INTO Ads (ad_id, campaign_id, ad_type, creative_link, creation_date) VALUES 
(302, 202, 'Video', 'https://adcampaigns.net/creatives/video-302', TO_DATE('2024-04-01', 'YYYY-MM-DD'));


-- 6.I inserted data into the Billing table to cover different billing plans, payment methods, and statuses, including both paid and due invoices.
INSERT INTO Billing (account_id, billing_date, plan, payment_method, status, sub_total, taxes) VALUES 
(1, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'Enterprise', 'Credit Card', 'Paid', 15500, 1550);


-- 7.Lastly, I inserted data into the Reports table, linking reports to their respective accounts, ad accounts, and campaigns, and providing a link to the document of the report.

INSERT INTO Reports (report_id, account_id, ad_account_id, last_update_date, campaign_id, document_link) VALUES 
(401, 1, 101, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 201, 'https://adcampaigns.net/reports/401');



-- ********************************************************************************************************************
