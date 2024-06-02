-- Table: public.deployment_detailhistory

-- DROP TABLE IF EXISTS public.deployment_detailhistory;
-- enable the uuid-ossp extension in your PostgreSQL database
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS public.deployment_detailhistory
(
    id character varying(100) COLLATE pg_catalog."default" NOT NULL DEFAULT uuid_generate_v4(),
    version character varying(100) COLLATE pg_catalog."default",
    action text COLLATE pg_catalog."default",
    build_link character varying(255) COLLATE pg_catalog."default",
    status text COLLATE pg_catalog."default",
    "timestamp" timestamp without time zone,
    failure_category character varying(50) COLLATE pg_catalog."default",
    prevention_plan text COLLATE pg_catalog."default",
    user_name character varying(50) COLLATE pg_catalog."default",
    resolution text COLLATE pg_catalog."default",
    rca_or_jira character varying(255) COLLATE pg_catalog."default",
    analyzed boolean,
    env character varying(20) COLLATE pg_catalog."default",
    channel character varying(50) COLLATE pg_catalog."default",
    reason text COLLATE pg_catalog."default",
    approver character varying(50) COLLATE pg_catalog."default",
    service character varying(100) COLLATE pg_catalog."default",
    approved character varying(20) COLLATE pg_catalog."default",
    job_name character varying(100) COLLATE pg_catalog."default",
    bu character varying(50) COLLATE pg_catalog."default",
    action_type character varying(20) COLLATE pg_catalog."default",
    epoch_timestamp bigint,
    failed_stage character varying(255) COLLATE pg_catalog."default",
    errors_message text COLLATE pg_catalog."default",
    rcaorjira character varying(255) COLLATE pg_catalog."default",
    rcatype character varying(255) COLLATE pg_catalog."default",
    error_message text COLLATE pg_catalog."default",
    sub_jobs_status character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT deployment_detailhistory_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.deployment_detailhistory
    OWNER to postgres;
	
--insert data from csv file
COPY public.deployment_detailhistory (
    id, version, action, build_link, status, "timestamp", failure_category, 
    prevention_plan, user_name, resolution, rca_or_jira, analyzed, env, 
    channel, reason, approver, service, approved, job_name, bu, 
    action_type, epoch_timestamp, failed_stage, errors_message, 
    rcaorjira, rcatype, error_message, sub_jobs_status
) FROM 'D:\\Intern Project\deployment_history_table_datafinal_v5_Feb5.csv' DELIMITER ',' CSV HEADER QUOTE '"';
