use new_schema;
CREATE TABLE IF NOT EXISTS company(
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(100) NOT NULL,
   phone INT(11) NOT NULL,
   adress VARCHAR(500) NOT NULL,
   email VARCHAR(100) NOT NULL,
   pass VARCHAR(100) NOT NULL,
   dateDK DATE NOT NULL ,
   mst INT NOT NULL,
   web VARCHAR(100) NOT NULL,
   location VARCHAR(100) NOT NULL,
 ngaylamviec VARCHAR(100) NOT NULL,
 imgSrc VARCHAR(100) NOT NULL,
  dometicFlag  bool default true -- True is company trong nuoc, fasle nuoc ngoai
);



CREATE TABLE IF NOT EXISTS users(
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(100) NOT NULL,
   phone INT(11) NOT NULL,
   adress VARCHAR(500) NOT NULL,
   email VARCHAR(100) NOT NULL,
   pass VARCHAR(100) NOT NULL,
   dateDK DATE NOT NULL,
 Bdate DATE NOT NULL,
   bangCap VARCHAR(100) NOT NULL,
   kiNangMem VARCHAR(100) NOT NULL,
ngoaiNgu VARCHAR(100) NOT NULL,
imgSrc VARCHAR(100) NOT NULL
);

-- dich vu
CREATE TABLE IF NOT EXISTS service(
   name VARCHAR(100) NOT NULL PRIMARY KEY,
   price INT NOT NULL
);


-- cong viec
CREATE TABLE IF NOT EXISTS job(
   viTri VARCHAR(100) NOT NULL PRIMARY KEY,
   mieuTa VARCHAR(2000) NOT NULL,
    minSalary INT,
     maxSalary INT 
);

-- tin tuyen dung, quan he 1-N
CREATE TABLE IF NOT EXISTS post(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  tieuDe VARCHAR(200) NOT NULL ,
   noiDung VARCHAR(2000) NOT NULL,
    datePost DATE NOT NULL,
    idCompany INT NOT NULL,
    FOREIGN KEY (idCompany)
        REFERENCES company(id)
        ON DELETE CASCADE
);


-- ki nang java css html
CREATE TABLE IF NOT EXISTS skill(
 
  name VARCHAR(100) NOT NULL PRIMARY KEY
  
);


-- quan he , tat ca deu N-N , 1 cai 1-N :cong ty dang tin tuyen dung
-- nguoi dung danh gia cty
CREATE TABLE IF NOT EXISTS danhgia(
userID int,
companyID int,
Constraint FOREIGN KEY (userID) REFERENCES users(id),
Constraint FOREIGN KEY (companyID) REFERENCES company(id)
);

-- cty dang ki dich vu
  CREATE TABLE IF NOT EXISTS dangkidichvu(
nameDV VARCHAR(100) ,
companyID int,
dateDK date not null,
Constraint FOREIGN KEY (nameDV) REFERENCES service(name),
Constraint FOREIGN KEY (companyID) REFERENCES company(id)
);

-- nguoi dung co  ki nang gi
  CREATE TABLE IF NOT EXISTS dapungkinang(
userID int,
skillName VARCHAR(100),
Constraint FOREIGN KEY (skillName) REFERENCES skill(name),
Constraint FOREIGN KEY (userID) REFERENCES users(id)
);

-- tin tuyen dung co  vi tri cong viec gi
  CREATE TABLE IF NOT EXISTS haveJob(
postID int,
vitriCV VARCHAR(100),
Constraint FOREIGN KEY (VitriCV) REFERENCES job(viTri ),
Constraint FOREIGN KEY (postID) REFERENCES post(id)
);

-- cong ty tuyen nhung vi tri cong viec nao
 CREATE TABLE IF NOT EXISTS tuyendung(
companyID int,
vitriCV VARCHAR(100),
Constraint FOREIGN KEY (companyID) REFERENCES company(id),
Constraint FOREIGN KEY (vitriCV) REFERENCES job(viTri )
);

-- nguoi dung user apply tin tuyen dung post
 CREATE TABLE IF NOT EXISTS apply(
postID int,
userID int,
status VARCHAR(100) default 'wait',
dateApply date not null,
CV VARCHAR(100),
Constraint FOREIGN KEY (postID) REFERENCES post(id),
Constraint FOREIGN KEY (userID) REFERENCES users(id )
);

 -- tin tuyen dung doi hoi co ki nang gi
 CREATE TABLE IF NOT EXISTS doihoikinang(
postID int,
skillName VARCHAR(100),
Constraint FOREIGN KEY (skillName) REFERENCES skill(name),
Constraint FOREIGN KEY (postID) REFERENCES post(id)
);

-- ko insert id vi auto_crement
insert into skill(name)  
values('Java');
insert into skill(name)  
values('Javascrip');

insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Tuyển dụng','FPT có tuyển dụng xxx','2018-12-1',1);

insert into job(viTri, mieuTa,minSalary,maxSalary)  
values('dev','môi trường thoáng mát sạch sẽ',100,1000000);

insert into service(name, price)  
values('tang like nha',1000000);

insert into users(name, phone, adress, email, pass, dateDK, Bdate, bangCap, kiNangMem, ngoaiNgu, imgSrc)  
values('danh',01123,'Tan binh','123@gmail.com','pass','2018-11-11','2018-02-11','dr','chém gió','english','/image/FPT.png');

insert into company(name, phone, adress, email, pass, dateDK, mst, web, location, ngaylamviec, imgSrc, dometicFlag)  
values('FPT',01123,'Tan binh','123@gmail.com','pass','2018-11-11',123,'itviec.com','HCM','2-3-5','/image/FPT.png',true);
insert into company(name, phone, adress, email, pass, dateDK, mst, web, location, ngaylamviec, imgSrc, dometicFlag)  
values('FPT',01123,'Tân binh, Hồ Chí Minh','123@gmail.com','pass','2018-11-11',123,'itviec.com','HCM','2-3-5','/image/FPT.png',true);



