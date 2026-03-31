create table patients(
    patient_id serial primary key ,
    full_name varchar(100) ,
    phone varchar(20) ,
    city varchar(50) ,
    symptoms text[]
);

create table doctors(
    doctor_id serial primary key ,
    full_name varchar(100) ,
    department  varchar(50)
);

create table appointments(
    appointment_id serial primary key ,
    patient_int int references patients(patient_id) ,
    doctor_id int references doctors(doctor_id) ,
    appointment_date date ,
    diagnosis varchar(200) ,
    fee numeric(10, 2)
);

-- 1.
insert into patients (full_name, phone, city, symptoms)
values ('Nguyen Van A', '0901234567', 'Ha Noi', ARRAY['fever', 'cough']),
       ('Tran Thi B', '0912345678', 'Hai Phong', ARRAY['headache']),
       ('Le Van C', '0923456789', 'Da Nang', ARRAY['stomachache', 'nausea']),
       ('Pham Thi D', '0934567890', 'Ho Chi Minh', ARRAY['fatigue']),
       ('Hoang Van E', '0945678901', 'Can Tho', ARRAY['cough', 'sore throat']);

insert into doctors (full_name, department)
values  ('Dr. Nguyen Minh', 'Cardiology'),
        ('Dr. Tran Hoa', 'Neurology'),
        ('Dr. Le Tuan', 'Gastroenterology'),
        ('Dr. Pham Lan', 'General'),
        ('Dr. Hoang Nam', 'ENT');

insert into appointments (patient_int, doctor_id, appointment_date, diagnosis, fee)
values (1, 4, '2026-03-01', 'Common cold', 200000),
       (2, 2, '2026-03-02', 'Migraine', 300000),
       (3, 3, '2026-03-03', 'Gastritis', 350000),
       (4, 1, '2026-03-04', 'Heart checkup', 500000),
       (5, 5, '2026-03-05', 'Throat infection', 250000),
       (1, 1, '2026-03-06', 'Hypertension', 400000),
       (2, 4, '2026-03-07', 'General fatigue', 200000),
       (3, 3, '2026-03-08', 'Food poisoning', 450000),
       (4, 2, '2026-03-09', 'Stress', 300000),
       (5, 5, '2026-03-10', 'Sinusitis', 350000);

-- 2.
create index idx_phone on patients(phone);
create index idex_city on patients using hash (city);
create index idex_symptoms on patients using gin (symptoms);
-- Lấy ra thông tin các bệnh nhân bị ho
select *
from patients p
where 'cough' = any(p.symptoms);

create extension btree_gist;
create index  idex_fee on appointments using gist (fee);

-- 3.
create index idx_date on appointments(appointment_date);
cluster  appointments using idx_date;

-- 4.
-- a.
create view vw_patient_top3
as
    select p.patient_id, p.full_name, p.phone, sum(a.fee) as "Total_fee"
        from patients p join appointments a on p.patient_id = a.patient_int
        group by p.patient_id, p.full_name, p.phone
        limit 3;
select * from vw_patient_top3;

-- b.
create view vw_doctors
as
select a.doctor_id, count(a.appointment_id) as "cnt_appointment"
from appointments a
group by a.doctor_id;
select * from vw_doctors;

-- 5.
create view vw_patient_city
as
select p.patient_id, p.full_name, p.city
from patients p
where p.city in ('Ha Noi', 'Can Tho')
with check option ;
select * from vw_patient_city;
update vw_patient_city
set city = 'Ho Chi Minh'
where patient_id = 1



