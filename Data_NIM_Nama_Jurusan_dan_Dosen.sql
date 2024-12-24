SELECT m.NIM, m.Nama, m.Jurusan, mk.DosenPengajar
FROM Mahasiswa m
JOIN MataKuliah mk ON m.NIM = mk.NIM
WHERE m.Jurusan = 'Teknik Informatika';
