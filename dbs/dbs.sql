DROP DATABASE IF EXISTS `recruitment`;

CREATE DATABASE `recruitment` CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `recruitment`;

CREATE TABLE IF NOT EXISTS company(
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(100) NOT NULL UNIQUE,
   phone VARCHAR(15) NOT NULL UNIQUE,
   adress VARCHAR(500) NOT NULL,
   email VARCHAR(100) NOT NULL UNIQUE,
   pass VARCHAR(100) NOT NULL,
   dateDK DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ,
   mst VARCHAR(15) NOT NULL,
   web VARCHAR(100) NOT NULL,
   location VARCHAR(100) NOT NULL,
   ngaylamviec VARCHAR(100) NOT NULL,
   imgSrc VARCHAR(100) NOT NULL,
   dometicFlag  INT default 1 -- 1 is company trong nuoc, 0 nuoc ngoai
);



CREATE TABLE IF NOT EXISTS users(
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(100) NOT NULL,
   last_name VARCHAR(100) NOT NULL,
   phone VARCHAR(15) NOT NULL,
   address VARCHAR(500),
   email VARCHAR(100) NOT NULL UNIQUE,
   pass VARCHAR(100) NOT NULL,
   dateDK DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	 Bdate DATE,
   bangCap VARCHAR(100) ,
   kiNangMem VARCHAR(100) ,
   ngoaiNgu VARCHAR(100),
   imgSrc VARCHAR(100)
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
        ON DELETE RESTRICT
);


-- ki nang java css html
CREATE TABLE IF NOT EXISTS skill(
 
  name VARCHAR(100) NOT NULL PRIMARY KEY
  
);


-- quan he , tat ca deu N-N , 1 cai 1-N :cong ty dang tin tuyen dung
-- nguoi dung danh gia cty
CREATE TABLE IF NOT EXISTS danhgia(
star int,
cmt VARCHAR(500),
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





-- import company ne hoac import tu csv neu muon
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('1', 'Acb', '2366329930', '68483 Roxbury Plaza', 'atoomer0@thetimes.co.uk', '1siR3DFJ', '2017-09-02', '9436692137', 'Acb.com', '953 Melby Plaza', 'Monday - Friday', '/image/Acb.png', '0');
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('2', 'Dek', '2528280337', '7 Mariners Cove Lane', 'hsextone1@ocn.ne.jp', 'uCQNl4x7kQkU', '2015-08-16', '0167287796', 'Dek.com', '2321 Carioca Crossing', 'Monday - Friday', '/image/Dek.jpg', '0');
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('3', 'Evolable', '8945171161', '24108 Karstens Hill', 'atutton2@mit.edu', 'vSwVVEKYvf', '2014-01-23', '5865157833', 'Evolable.com', '85 David Trail', 'Monday - Friday', '/image/Evolable.png', '0');
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('4', 'FPT', '9161952066', '51034 Messerschmidt Junction', 'hkneath3@gov.uk', '6Ndwxv8', '2015-08-10', '9519313486', 'FPT.com', '483 Ohio Court', 'Monday - Friday', '/image/FPT.png', '1');
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('5', 'Fram', '9303638212', '02509 Holy Cross Place', 'mpeever4@wiley.com', 'bAw5KO', '2013-07-02', '4591111679', 'Fram.com', '74631 Hudson Road', 'Monday - Friday', '/image/Fram.png', '1');
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('6', 'Gotadi', '4989318926', '746 Rockefeller Point', 'pdebrick5@sciencedirect.com', 'FcJqqBX', '2015-10-09', '4274985806', 'Gotadi.com', '923 Division Road', 'Monday - Friday', '/image/Gotadi.png', '0');
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('7', 'Intec', '9132615549', '6952 Stephen Court', 'rrissom6@yellowbook.com', 'hVrYMlhZejM', '2018-01-27', '8721311242', 'Intec.com', '57 Amoth Way', 'Monday - Friday', '/image/Intec.jpg', '1');
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('8', 'VNG', '3681854206', '2804 Swallow Hill', 'sculley7@livejournal.com', 'CONqdSAfHCi', '2014-10-18', '5390110617', 'VNG.com', '26 Coolidge Terrace', 'Monday - Friday', '/image/VNG.jpg', '1');
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('9', 'Knorex', '5633150582', '07250 Upham Drive', 'dlivoir8@mayoclinic.com', 'IqylIuuPCet3', '2016-09-06', '5046391260', 'Knorex.com', '310 Moose Center', 'Monday - Friday', '/image/Knorex.png', '1');
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('10', 'KMS', '8606186769', '9 Namekagon Pass', 'cmalek9@yellowpages.com', 'bmxSYuKgA', '2017-11-21', '0194577503', 'KMS.com', '4 Dexter Circle', 'Monday - Friday', '/image/KMS.png', '1');
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('11', 'LG', '9447807815', '6574 Hintze Crossing', 'jcastelleta@businesswire.com', '6XdIUe', '2014-07-15', '1811263232', 'LG.com', '43 Stuart Drive', 'Monday - Friday', '/image/LG.png', '0');
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('12', 'LHV', '8797445919', '2 Prairie Rose Junction', 'tkennetb@va.gov', 'PIbaleJ1PrP', '2017-10-21', '8115508047', 'LHV.com', '666 Buell Place', 'Monday - Friday', '/image/LHV.jpg', '0');
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('13', 'Misfit', '8426360037', '82655 Russell Court', 'nverrillc@networkadvertising.org', 'oHxSFZnuW8', '2017-07-21', '7268033451', 'Misfit.com', '67 Amoth Circle', 'Monday - Friday', '/image/Misfit.jpg', '0');
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('14', 'Momo', '9528855375', '36196 John Wall Parkway', 'pgoftond@cnn.com', '2jg6kcRWpD', '2017-07-17', '8907573824', 'Momo.com', '8006 Mandrake Parkway', 'Monday - Friday', '/image/Momo.png', '0');
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('15', 'Moso', '7136269060', '725 Veith Lane', 'esamuele@ameblo.jp', 'RsfMwldP6UC', '2017-03-09', '4548439544', 'Moso.com', '17 Atwood Trail', 'Monday - Friday', '/image/Moso.png', '1');
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('16', 'Ruby', '6512282943', '8075 Clyde Gallagher Pass', 'iwoosterf@ezinearticles.com', '0DJQ9F', '2015-10-20', '5044923060', 'Ruby.com', '42791 Atwood Terrace', 'Monday - Friday', '/image/Ruby.jpg', '1');
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('17', 'Scout', '6891339401', '67164 Holmberg Center', 'kstledgerg@reference.com', 'ChdCTN4rRk', '2014-05-18', '7472287520', 'Scout.com', '4393 Oakridge Point', 'Monday - Friday', '/image/Scout.png', '0');
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('18', 'Toshiba', '4435841908', '1512 Iowa Pass', 'spearsonh@yale.edu', 'UqOA0K', '2017-07-28', '4137057354', 'Toshiba.com', '16981 Becker Center', 'Monday - Friday', '/image/Toshiba.jpg', '1');
INSERT INTO `company` (`id`, `name`, `phone`, `adress`, `email`, `pass`, `dateDK`, `mst`, `web`, `location`, `ngaylamviec`, `imgSrc`, `dometicFlag`) VALUES ('19', 'Trg', '9897168888', '184 Hermina Court', 'rkieri@bbb.org', 'vBoPZT3af', '2014-04-27', '6752625387', 'Trg.com', '99533 Sunfield Parkway', 'Monday - Friday', '/image/Trg.png', '0');








insert into skill(name)  
values('Java');
insert into skill(name)  
values('Javascrip');
insert into skill(name)  
values('C++');
insert into skill(name)  
values('C');
insert into skill(name)  
values('html');
insert into skill(name)  
values('python');
insert into skill(name)  
values('scala');
insert into skill(name)  
values('C#');
insert into skill(name)  
values('css');
insert into skill(name)  
values('pascal');

insert into service(name, price)  
values('Tang like',1000);

insert into post(tieuDe, noiDung,datePost,idCompany)  
values('10 Java/python Devs (SQL, HTML5/CSS) ~$1200','Lập trình trong các dự án gia công phần mềm cho khách hàng Nhật sử dụng ngôn ngữ Java hoặc PHP. Tham gia các công đoạn tìm hiểu yêu cầu, phân tích, thiết kế, nghiên cứu công nghệ khi được phân công. Tham gia quản lý hay đào tạo nhóm nếu có khả năng phù hợp','2018-05-06',1);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('[Up to $1200] 05 Java Devs (Spring, MVC)','Có tối thiểu từ 2 năm kinh nghiệm lập trình Java Web, Java Core. Có kinh nghiệm lập trình với các framework: SpingMVC, MyBatis, Hibernate. Có kinh nghiệm lập trình web với MVC framework,Unit Test. Có kinh nghiệm sử dụng Jenkins, Maven, configurate. Địa điểm làm việc: Hà Nội hoặc Đà Nẵng','2018-05-07',2);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('2 Java Developers (AI, Big Data) ~$1500','Hanatour Japan System Vietnam is a new established Company with 100% investment from Japanese Company.. We are developing an intergrated application related to Tour/Hotel/Flight ticket/Rental Car reservation system for our Headquarter in Japan.. The Mother Company is a big and leading provider of safe and insprational trips to travellers worldwide.. We will expand our business as an integrated travel company,and aim to be the leading Japanese travel company by 2020.. The Company in Vietnam is expected to be a development center of the Mother company, develop own products.','2018-05-06',3);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Machine Learning Engineer (Python, Java)','Đã có kinh nghiệm với các bài toán machine learning trong các hệ thống thương mại điện tử.. Kinh nghiệm làm việc và triển khai ứng dụng Machine Learning trên hệ thống phân tán (distributed system).. Có kinh nghiệm làm việc với Natural Language Processing, đặc biệt là Recurrent Neural Networks (LSTM, biLSTM).','2018-05-06',4);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('[Up to $1200] 05 Java Devs (Spring, MVC)','Có tối thiểu từ 2 năm kinh nghiệm lập trình Java Web, Java Core. Có kinh nghiệm lập trình với các framework: SpingMVC, MyBatis, Hibernate. Có kinh nghiệm lập trình web với MVC framework,Unit Test. Có kinh nghiệm sử dụng Jenkins, Maven, configurate. Địa điểm làm việc: Hà Nội hoặc Đà Nẵng','2018-05-08',5);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Lead DevOps System Engineer (Linux/Java)','Design, support and enhance the automated DevOps release management pipeline which delivers tooling for next generation application development (“Dev”) efforts and on-going production operations (“Ops”).. Foster a continuous delivery and cloud first mindset.. Partner with development and operations teams to develop practical automation solutions and custom modules.. Troubleshoot automation issues and find practical solutions that move projects forward in a timely manner.. Perform complex application programming activities from coding, testing and troubles. Drive delivery direction of the DevOps Teams. Assess, identify, recommend DevOps policy and procedures impacted by change resulting from project assignments or day-to-day business process areas priorities.. Play an integral role in designing and developing continuous delivery, automation and build pipelines that will help the scrum teams delivery fast with minimal technical impediments.. Identify and develop opportunities to improve our processes and tools specifically for Automation.. Manage day-to-day workload and requests using Agile and Lean practices.. Make sure the execution of the builds and deployments to all environments based on build schedule happens','2018-05-06',6);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Web Technical Lead (PHP, Java, C#)','Quản lý và tham gia trực tiếp các vấn đề kỹ thuật các dự án thuộc Team Web.. Dự đoán, quản lí và giải quyết các vấn đề rủi ro, phụ thuộc và trở ngại có thể ảnh hưởng đến các dự án của Team.. Quản lí nhân sự, tuyển dụng, đào tạo và điều phối nhân sự của Team.. Quản lí phạm vi, kế hoạch dự án và phân công nhiệm vụ., theo dõi các thành viên trong nhóm.. Phân tích, Quản lí yêu cầu của khách hàng và tham gia tư vấn và trao đổi với khách hàng. . Chịu trách nhiệm về chất lượng của các dự án thuộc quản lí của Team. . Làm việc chặt chẽ với PMO để theo dõi tình trạng dự án, rủi ro và kế hoạch hành động. . Hợp tác với các bộ phận khác liên quan để triển khai dự án và hoàn thành theo kế hoạch. . Góp phần tích cực cùng PMO cải tiến quy trình và nâng cao chất lượng công việc. ','2018-05-06',7);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('02 Azure Cloud Developers (Java, .NET)','FPT Software Hanoi is looking for 2 Azure Developer with at least 1 years’ experience. The customers are big companies in US, Europe and APAC.. When you join with us, you will have many opportunities for yourself:. Research and train on job with new technologies in Azure and other Cloud Providers.. Design and implement Azure solution projects with other senior/experts. Have chance to work onsite short-time for projects around the world.','2018-05-06',8);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Full Stack Developer Java','Curfex is a dynamic P2P blockchain technology company based in Hong Ko­­­ng providing online peer-to-peer money transfer services. . We are looking for a full stack developer who will take a key role on our team. Our full stack developer must have knowledge in all stages of software development. . You will be working alongside other engineers and developers internationally, collaborating on various layers of the infrastructure for our platform.','2018-05-06',9);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Android Developer (UI-UX, Java)','Lập trình trong các dự án gia công phần mềm cho khách hàng Nhật sử dụng ngôn ngữ Java hoặc PHP. Tham gia các công đoạn tìm hiểu yêu cầu, phân tích, thiết kế, nghiên cứu công nghệ khi được phân công.. Tham gia quản lý hay đào tạo nhóm nếu có khả năng phù hợp','2018-05-04',10);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Web Technical Lead (PHP, Java, C#)','Quản lý và tham gia trực tiếp các vấn đề kỹ thuật các dự án thuộc Team Web.. Dự đoán, quản lí và giải quyết các vấn đề rủi ro, phụ thuộc và trở ngại có thể ảnh hưởng đến các dự án của Team.. Quản lí nhân sự, tuyển dụng, đào tạo và điều phối nhân sự của Team.. Quản lí phạm vi, kế hoạch dự án và phân công nhiệm vụ., theo dõi các thành viên trong nhóm.. Phân tích, Quản lí yêu cầu của khách hàng và tham gia tư vấn và trao đổi với khách hàng. . Chịu trách nhiệm về chất lượng của các dự án thuộc quản lí của Team. . Làm việc chặt chẽ với PMO để theo dõi tình trạng dự án, rủi ro và kế hoạch hành động. . Hợp tác với các bộ phận khác liên quan để triển khai dự án và hoàn thành theo kế hoạch. . Góp phần tích cực cùng PMO cải tiến quy trình và nâng cao chất lượng công việc. ','2018-05-06',11);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('02 Azure Cloud Developers (Java, .NET)','FPT Software Hanoi is looking for 2 Azure Developer with at least 1 years’ experience. The customers are big companies in US, Europe and APAC.. When you join with us, you will have many opportunities for yourself:. Research and train on job with new technologies in Azure and other Cloud Providers.. Design and implement Azure solution projects with other senior/experts. Have chance to work onsite short-time for projects around the world.','2018-05-06',12);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Full Stack Developer Java','Curfex is a dynamic P2P blockchain technology company based in Hong Ko­­­ng providing online peer-to-peer money transfer services. . We are looking for a full stack developer who will take a key role on our team. Our full stack developer must have knowledge in all stages of software development. . You will be working alongside other engineers and developers internationally, collaborating on various layers of the infrastructure for our platform.','2018-05-06',13);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Android Developer (UI-UX, Java)','Lập trình trong các dự án gia công phần mềm cho khách hàng Nhật sử dụng ngôn ngữ Java hoặc PHP. Tham gia các công đoạn tìm hiểu yêu cầu, phân tích, thiết kế, nghiên cứu công nghệ khi được phân công.. Tham gia quản lý hay đào tạo nhóm nếu có khả năng phù hợp','2018-05-03',14);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Web Technical Lead (PHP, Java, C#)','Quản lý và tham gia trực tiếp các vấn đề kỹ thuật các dự án thuộc Team Web.. Dự đoán, quản lí và giải quyết các vấn đề rủi ro, phụ thuộc và trở ngại có thể ảnh hưởng đến các dự án của Team.. Quản lí nhân sự, tuyển dụng, đào tạo và điều phối nhân sự của Team.. Quản lí phạm vi, kế hoạch dự án và phân công nhiệm vụ., theo dõi các thành viên trong nhóm.. Phân tích, Quản lí yêu cầu của khách hàng và tham gia tư vấn và trao đổi với khách hàng. . Chịu trách nhiệm về chất lượng của các dự án thuộc quản lí của Team. . Làm việc chặt chẽ với PMO để theo dõi tình trạng dự án, rủi ro và kế hoạch hành động. . Hợp tác với các bộ phận khác liên quan để triển khai dự án và hoàn thành theo kế hoạch. . Góp phần tích cực cùng PMO cải tiến quy trình và nâng cao chất lượng công việc. ','2018-05-06',15);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('02 Azure Cloud Developers (Java, .NET)','FPT Software Hanoi is looking for 2 Azure Developer with at least 1 years’ experience. The customers are big companies in US, Europe and APAC.. When you join with us, you will have many opportunities for yourself:. Research and train on job with new technologies in Azure and other Cloud Providers.. Design and implement Azure solution projects with other senior/experts. Have chance to work onsite short-time for projects around the world.','2018-05-06',16);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Full Stack Developer Java','Curfex is a dynamic P2P blockchain technology company based in Hong Ko­­­ng providing online peer-to-peer money transfer services. . We are looking for a full stack developer who will take a key role on our team. Our full stack developer must have knowledge in all stages of software development. . You will be working alongside other engineers and developers internationally, collaborating on various layers of the infrastructure for our platform.','2018-05-06',9);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Android Developer (UI-UX, Java)','Lập trình trong các dự án gia công phần mềm cho khách hàng Nhật sử dụng ngôn ngữ Java hoặc PHP. Tham gia các công đoạn tìm hiểu yêu cầu, phân tích, thiết kế, nghiên cứu công nghệ khi được phân công.. Tham gia quản lý hay đào tạo nhóm nếu có khả năng phù hợp','2018-05-02',17);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Web Technical Lead (PHP, Java, C#)','Quản lý và tham gia trực tiếp các vấn đề kỹ thuật các dự án thuộc Team Web.. Dự đoán, quản lí và giải quyết các vấn đề rủi ro, phụ thuộc và trở ngại có thể ảnh hưởng đến các dự án của Team.. Quản lí nhân sự, tuyển dụng, đào tạo và điều phối nhân sự của Team.. Quản lí phạm vi, kế hoạch dự án và phân công nhiệm vụ., theo dõi các thành viên trong nhóm.. Phân tích, Quản lí yêu cầu của khách hàng và tham gia tư vấn và trao đổi với khách hàng. . Chịu trách nhiệm về chất lượng của các dự án thuộc quản lí của Team. . Làm việc chặt chẽ với PMO để theo dõi tình trạng dự án, rủi ro và kế hoạch hành động. . Hợp tác với các bộ phận khác liên quan để triển khai dự án và hoàn thành theo kế hoạch. . Góp phần tích cực cùng PMO cải tiến quy trình và nâng cao chất lượng công việc. ','2018-05-06',18);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('02 Azure Cloud Developers (Java, .NET)','FPT Software Hanoi is looking for 2 Azure Developer with at least 1 years’ experience. The customers are big companies in US, Europe and APAC.. When you join with us, you will have many opportunities for yourself:. Research and train on job with new technologies in Azure and other Cloud Providers.. Design and implement Azure solution projects with other senior/experts. Have chance to work onsite short-time for projects around the world.','2018-05-06',19);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Full Stack Developer Java','Curfex is a dynamic P2P blockchain technology company based in Hong Ko­­­ng providing online peer-to-peer money transfer services. . We are looking for a full stack developer who will take a key role on our team. Our full stack developer must have knowledge in all stages of software development. . You will be working alongside other engineers and developers internationally, collaborating on various layers of the infrastructure for our platform.','2018-05-06',9);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Android Developer (UI-UX, Java)','Lập trình trong các dự án gia công phần mềm cho khách hàng Nhật sử dụng ngôn ngữ Java hoặc PHP. Tham gia các công đoạn tìm hiểu yêu cầu, phân tích, thiết kế, nghiên cứu công nghệ khi được phân công.. Tham gia quản lý hay đào tạo nhóm nếu có khả năng phù hợp','2018-05-06',19);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Web Technical Lead (PHP, Java, C#)','Quản lý và tham gia trực tiếp các vấn đề kỹ thuật các dự án thuộc Team Web.. Dự đoán, quản lí và giải quyết các vấn đề rủi ro, phụ thuộc và trở ngại có thể ảnh hưởng đến các dự án của Team.. Quản lí nhân sự, tuyển dụng, đào tạo và điều phối nhân sự của Team.. Quản lí phạm vi, kế hoạch dự án và phân công nhiệm vụ., theo dõi các thành viên trong nhóm.. Phân tích, Quản lí yêu cầu của khách hàng và tham gia tư vấn và trao đổi với khách hàng. . Chịu trách nhiệm về chất lượng của các dự án thuộc quản lí của Team. . Làm việc chặt chẽ với PMO để theo dõi tình trạng dự án, rủi ro và kế hoạch hành động. . Hợp tác với các bộ phận khác liên quan để triển khai dự án và hoàn thành theo kế hoạch. . Góp phần tích cực cùng PMO cải tiến quy trình và nâng cao chất lượng công việc. ','2018-05-06',7);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('02 Azure Cloud Developers (Java, .NET)','FPT Software Hanoi is looking for 2 Azure Developer with at least 1 years’ experience. The customers are big companies in US, Europe and APAC.. When you join with us, you will have many opportunities for yourself:. Research and train on job with new technologies in Azure and other Cloud Providers.. Design and implement Azure solution projects with other senior/experts. Have chance to work onsite short-time for projects around the world.','2018-05-06',8);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Full Stack Developer Java','Curfex is a dynamic P2P blockchain technology company based in Hong Ko­­­ng providing online peer-to-peer money transfer services. . We are looking for a full stack developer who will take a key role on our team. Our full stack developer must have knowledge in all stages of software development. . You will be working alongside other engineers and developers internationally, collaborating on various layers of the infrastructure for our platform.','2018-05-06',9);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Android Developer (UI-UX, Java)','Lập trình trong các dự án gia công phần mềm cho khách hàng Nhật sử dụng ngôn ngữ Java hoặc PHP. Tham gia các công đoạn tìm hiểu yêu cầu, phân tích, thiết kế, nghiên cứu công nghệ khi được phân công.. Tham gia quản lý hay đào tạo nhóm nếu có khả năng phù hợp','2018-05-06',10);

-- tao danh gia mau
insert into danhgia values (4,'Great',1,1);
insert into danhgia values (3,'Great',1,2);
insert into danhgia values (4,'Great',1,3);
insert into danhgia values (5,'Great',1,4);
insert into danhgia values (4,'Great',1,5);
insert into danhgia values (4,'Great',1,6);
insert into danhgia values (4,'Great',1,7);
insert into danhgia values (1,'Great',1,8);
insert into danhgia values (4,'Great',1,9);
insert into danhgia values (1,'Great',1,10);
insert into danhgia values (4,'Great',1,8);
insert into danhgia values (3,'Great',1,11);
insert into danhgia values (4,'Great',1,12);
insert into danhgia values (4,'Great',1,13);
insert into danhgia values (5,'Great',1,14);
insert into danhgia values (4,'Great',1,15);
insert into danhgia values (4,'Great',1,16);
insert into danhgia values (5,'Great',1,17);
insert into danhgia values (4,'Great',1,18);
insert into danhgia values (5,'Great',1,19);
insert into danhgia values (3,'Great',1,11);
insert into danhgia values (4,'Great',1,12);
insert into danhgia values (2,'Great',1,13);
insert into danhgia values (5,'Great',1,14);
insert into danhgia values (2,'Great',1,15);
insert into danhgia values (4,'Great',1,16);
insert into danhgia values (2,'Great',1,17);
insert into danhgia values (4,'Great',1,18);
insert into danhgia values (5,'Great',1,19);