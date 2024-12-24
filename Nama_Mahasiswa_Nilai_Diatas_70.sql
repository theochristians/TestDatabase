SELECT m.Nama, mk.MataKuliah, mk.Nilai
FROM Mahasiswa m
JOIN MataKuliah mk ON m.NIM = mk.NIM
WHERE mk.Nilai > 70;
