# README: Test Database Queries

## Project Overview
This project involves creating a test database for managing student and course data. The database includes two tables: `Mahasiswa` and `MataKuliah`. The goal is to execute various SQL operations for updating, retrieving, and filtering data based on specific requirements.

## Tables
1. **Mahasiswa**
   - Stores information about students.
   - Fields: `NIM` (Primary Key), `Nama`, `Alamat`, `Jurusan`, `Umur`.

2. **MataKuliah**
   - Stores information about courses taken by students.
   - Fields: `ID` (Primary Key), `MataKuliah`, `NIM` (Foreign Key), `Nilai`, `DosenPengajar`.

## Schema and Data Setup

### Create `Mahasiswa` Table and Insert Data
```sql
CREATE TABLE Mahasiswa (
    NIM VARCHAR(10) PRIMARY KEY,
    Nama VARCHAR(50),
    Alamat VARCHAR(100),
    Jurusan VARCHAR(50),
    Umur INT
);

INSERT INTO Mahasiswa (NIM, Nama, Alamat, Jurusan, Umur) VALUES
('123456', 'John', 'Jl. Merdeka No. 1', 'Teknik Informatika', 21),
('234567', 'Alice', 'Jl. Gatot Subroto', 'Sistem Informasi', 23),
('345678', 'Bob', 'Jl. Sudirman No. 5', 'Teknik Informatika', 20),
('456789', 'Cindy', 'Jl. Pahlawan No. 2', 'Manajemen', 22),
('567890', 'David', 'Jl. Diponegoro No. 3', 'Teknik Elektro', 25),
('678901', 'Emily', 'Jl. Cendrawasih No. 4', 'Manajemen', 24),
('789012', 'Frank', 'Jl. Ahmad Yani No. 6', 'Teknik Informatika', 19);
```

### Create `MataKuliah` Table and Insert Data
```sql
CREATE TABLE MataKuliah (
    ID INT PRIMARY KEY,
    MataKuliah VARCHAR(50),
    NIM VARCHAR(10),
    Nilai INT,
    DosenPengajar VARCHAR(50),
    FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM)
);

INSERT INTO MataKuliah (ID, MataKuliah, NIM, Nilai, DosenPengajar) VALUES
(1, 'Pemrograman Web', '123456', 85, 'Pak Budi'),
(2, 'Basis Data', '234567', 70, 'Ibu Ani'),
(3, 'Jaringan Komputer', '345678', 75, 'Pak Dodi'),
(4, 'Sistem Operasi', '123456', 90, 'Pak Budi'),
(5, 'Manajemen Proyek', '456789', 80, 'Ibu Desi'),
(6, 'Bahasa Inggris', '567890', 85, 'Ibu Eka'),
(7, 'Statistika', '678901', 75, 'Pak Farhan'),
(8, 'Algoritma', '789012', 65, 'Pak Galih'),
(9, 'Pemrograman Java', '123456', 95, 'Pak Budi');
```

## Test Tasks

### 1. Update Address for a Specific Student
Update the address of the student with `NIM` '123456' to `Jl. Raya No.5`.
```sql
UPDATE Mahasiswa
SET Alamat = 'Jl. Raya No.5'
WHERE NIM = '123456';
```

### 2. Retrieve Students in "Teknik Informatika"
Display `NIM`, `Nama`, and `Jurusan` of students whose major is "Teknik Informatika," along with their academic advisor's name.
```sql
SELECT m.NIM, m.Nama, m.Jurusan, mk.DosenPengajar
FROM Mahasiswa m
JOIN MataKuliah mk ON m.NIM = mk.NIM
WHERE m.Jurusan = 'Teknik Informatika';
```

### 3. Top 5 Oldest Students
Retrieve the top 5 students based on their age.
```sql
SELECT TOP 5 Nama, Umur
FROM Mahasiswa
ORDER BY Umur DESC;
```

### 4. Students with Grades Above 70
Retrieve the name of students, the courses they took, and the grades they achieved, only for grades above 70.
```sql
SELECT m.Nama, mk.MataKuliah, mk.Nilai
FROM Mahasiswa m
JOIN MataKuliah mk ON m.NIM = mk.NIM
WHERE mk.Nilai > 70;
```

## Example Outputs

### Task 1
Updated address for NIM '123456':
```
| NIM     | Nama   | Alamat          | Jurusan            | Umur |
|---------|--------|-----------------|--------------------|------|
| 123456  | John   | Jl. Raya No.5   | Teknik Informatika | 21   |
```

### Task 2
Students in "Teknik Informatika":
```
| NIM     | Nama   | Jurusan            | DosenPengajar |
|---------|--------|--------------------|---------------|
| 123456  | John   | Teknik Informatika | Pak Budi      |
| 345678  | Bob    | Teknik Informatika | Pak Dodi      |
| 789012  | Frank  | Teknik Informatika | Pak Galih     |
```

### Task 3
Top 5 oldest students:
```
| Nama    | Umur |
|---------|------|
| David   | 25   |
| Emily   | 24   |
| Alice   | 23   |
| Cindy   | 22   |
| John    | 21   |
```

### Task 4
Students with grades above 70:
```
| Nama    | MataKuliah        | Nilai |
|---------|-------------------|-------|
| John    | Pemrograman Web   | 85    |
| Bob     | Jaringan Komputer | 75    |
| John    | Sistem Operasi    | 90    |
| Cindy   | Manajemen Proyek  | 80    |
| David   | Bahasa Inggris    | 85    |
| Emily   | Statistika        | 75    |
| John    | Pemrograman Java  | 95    |
```

## Contribution
Contributions are welcome! Feel free to submit additional queries or improvements.

## License
This project is licensed under the MIT License.

