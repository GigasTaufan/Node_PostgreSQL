CREATE TABLE metode(
	id_metode SERIAL PRIMARY KEY,
	nama_metode VARCHAR(100)
);

INSERT INTO metode(nama_metode)
VALUES
	('Workshop / Self Learning'),
	('Sharing Practice / Professionals Talks'),
	('Discussion Room'),
	('Coaching'),
	('Mentoring'),
	('Job Assignment');

CREATE TABLE bulan(
	id_bulan SERIAL PRIMARY KEY,
	nama_bulan VARCHAR(11) UNIQUE NOT NULL
);

INSERT INTO bulan(nama_bulan)
VALUES
	('Januari'),
	('Februari'),
	('Maret'),
	('April'),
	('Mei'),
	('Juni'),
	('Juli'),
	('Agustus'),
	('September'),
	('Oktober'),
	('November'),
	('Desemeber');
	

CREATE TABLE acara(
	id_acara SERIAL PRIMARY KEY,
	id_metode INTEGER REFERENCES metode(id_metode),
	nama_acara VARCHAR(150),
	id_bulan INTEGER REFERENCES bulan(id_bulan),
	tanggal_mulai DATE,
	tanggal_selesai DATE
);


INSERT INTO acara(id_metode, nama_acara, id_bulan, tanggal_mulai, tanggal_selesai)
VALUES
	-- Workshop - Januari
	(1, 'Fundamental of Superintendence', 1, '2019-01-02', '2019-01-05'),
	(1, 'Introduction to TIC Industy', 1, '2019-01-03', '2019-01-05'),
	(1, 'Rindam Bela Negara', 1, '2019-01-04', '2019-01-05'),
	(1, 'Human Resource Generalist', 1, '2019-01-05', '2019-01-10'),
	(1, 'Basic Finance For Business', 1, '2019-01-10', '2019-01-15'),
	
	-- WORKSHOP - FEBRUARI
	(1, 'Basic Auditing', 2, '2019-02-02', '2019-02-05'),
	(1, 'Business Legal', 2, '2019-02-03', '2019-02-05'),
	(1, 'General Affair', 2, '2019-02-04', '2019-02-05'),
	(1, 'Risk Management', 2, '2019-02-05', '2019-02-05'),
	(1, 'Basic Business Process', 2, '2019-02-12', '2019-02-15'),
	
	-- WORKSHOP - JUNI
	(1, 'Basic Salesmanship', 6, '2019-06-02', '2019-06-05'),
	(1, 'Creative Thinking', 6, '2019-06-02', '2019-06-05'),
	(1, 'Data Analytics', 6, '2019-06-02', '2019-06-05'),
	(1, 'Managing Self Motivation', 6, '2019-06-02', '2019-06-05'),
	(1, 'Problem Solving & Decision Making', 6, '2019-06-02', '2019-06-05'),
	(1, 'Managing Performance', 6, '2019-06-02', '2019-06-05'),
	
	-- SHARING - MARET
	(2, 'Sharing Practice', 3, '2019-03-12', '2019-03-15'),
	-- SHARING - MEI
	(2, 'Sharing Practice', 5, '2019-05-12', '2019-05-15'),
	
	-- DISCUSSION - MARET
	(3, 'Ask The Expert', 3, '2019-05-02', '2019-05-05'),
	-- DISCUSSION - APRIL
	(3, 'Ask The Expert', 4, '2019-04-12', '2019-04-15'),
	-- DISCUSSION - MEI
	(3, 'Ask The Expert', 5, '2019-05-02', '2019-05-05'),
	
	
	-- COACHING - MEI
	(4, 'Group Couching', 5, '2019-05-12', '2019-05-15'),
	
	-- MENTORING - MARET
	(5, 'Mentoring Session', 3, '2019-03-05', '2019-03-10'),
	-- MENTORING - APRIL
	(5, 'Mentoring Session', 4, '2019-04-12', '2019-04-15'),
	-- MENTORING - MEI
	(5, 'Mentoring Session', 5, '2019-05-02', '2019-05-05');
	
	
	
	
	
	
SELECT * FROM metode;
	
	
	
	
	
	
	
	
	
	
	
	