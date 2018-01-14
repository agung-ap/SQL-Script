//nomor 2
CREATE OR REPLACE PROCEDURE jenisbuku
IS
jenisbuku integer(2);
BEGIN
    IF(jenisbuku = 1)THEN
    DBMS_OUTPUT.PUT_LINE('NOVEL');

    ELSE IF(jenisbuku = 1)THEN
    DBMS_OUTPUT.PUT_LINE('KOMIK');

    ELSE IF(jenisbuku = 1)THEN
    DBMS_OUTPUT.PUT_LINE('MAJALAH');

END IF;
END IF;
END IF;
END jenisbuku;

//nomor 3

create or replace procedure kode (a in char) as
kode 1 char (10);

cursor c_ketbuku is
select * from tbl_buku where jenisbuku = a;

vstatus c_ketbuku%rowtype;
BEGIN
    open c_ketbuku;
    DBMS_OUTPUT.PUT_LINE(RPAD('JENIS BUKU', 12 || 'KETERANGAN'));
    
    loop
        fetch c_ketbuku into vstatus;
        exit when c_ketbuku%notfound;
        
        IF(vstatus.jenisbuku = 1) THEN
        DBMS_OUTPUT.PUT_LINE(RPAD(vstatus.jenisbuku, 12 || 'NOVEL'));

        ELSE IF(vstatus.jenisbuku = 2) THEN
        DBMS_OUTPUT.PUT_LINE(RPAD(vstatus.jenisbuku, 12 || 'KOMIK'));

        ELSE IF(vstatus.jenisbuku = 3) THEN
        DBMS_OUTPUT.PUT_LINE(RPAD(vstatus.jenisbuku, 12 || 'MAJALAH'));

        END IF;
        END IF;
        END IF;

    END loop;
    close c_ketbuku;
    END;

BEGIN
kode('1');
END;       

//nomor 4


create or replace trigger tr_bi_tbl_pinjam
before insert on tr_bi_tbl_pinjaman

for each row

BEGIN
    DBMS_OUTPUT.PUT_LINE('trigger before insert dilaksanakan');
END

create or replace trigger tr_au_tbl_pinjam
after update on tr_bi_tbl_pinjam

for each row

BEGIN
    DBMS_OUTPUT.PUT_LINE('trigger after update dilaksanakan');
END

create or replace trigger tr_ad_tbl_pinjam
after delete on tbl_pinjam

for each row

BEGIN
    DBMS_OUTPUT.PUT_LINE('trigger after delete dilaksanakan');
END

insert into tbl_pinjam values('170002','3','JAN-22-18');

update tbl_pinjam
set noanggota = 170001 
where tglpinjam = 'JAN-22-18';

delete tbl_pinjam
where tglpinjam = 'JAN-22-18';