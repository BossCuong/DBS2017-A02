use new_schema;
CREATE TABLE IF NOT EXISTS company(
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(100) NOT NULL UNIQUE,
   phone VARCHAR(15) NOT NULL,
   adress VARCHAR(500) NOT NULL,
   email VARCHAR(100) NOT NULL,
   pass VARCHAR(100) NOT NULL,
   dateDK DATE NOT NULL ,
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
   adress VARCHAR(500),
   email VARCHAR(100) NOT NULL UNIQUE,
   pass VARCHAR(100) NOT NULL,
   dateDK DATE,
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
values('10 Java/python Devs (SQL, HTML5/CSS) ~$1200','Lập trình trong các dự án gia công phần mềm cho khách hàng Nhật sử dụng ngôn ngữ Java hoặc PHP
Tham gia các công đoạn tìm hiểu yêu cầu, phân tích, thiết kế, nghiên cứu công nghệ khi được phân công.
Tham gia quản lý hay đào tạo nhóm nếu có khả năng phù hợp','2018-05-06',1);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('[Up to $1200] 05 Java Devs (Spring, MVC)','Có tối thiểu từ 2 năm kinh nghiệm lập trình Java Web, Java Core
Có kinh nghiệm lập trình với các framework: SpingMVC, MyBatis, Hibernate
Có kinh nghiệm lập trình web với MVC framework,Unit Test
Có kinh nghiệm sử dụng Jenkins, Maven, configurate
Địa điểm làm việc: Hà Nội hoặc Đà Nẵng','2018-05-06',2);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('2 Java Developers (AI, Big Data) ~$1500','Hanatour Japan System Vietnam is a new established Company with 100% investment from Japanese Company.
We are developing an intergrated application related to Tour/Hotel/Flight ticket/Rental Car reservation system for our Headquarter in Japan.
The Mother Company is a big and leading provider of safe and insprational trips to travellers worldwide.
We will expand our business as an integrated travel company,and aim to be the leading Japanese travel company by 2020.
The Company in Vietnam is expected to be a development center of the Mother company, develop own products.','2018-05-06',3);

insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Machine Learning Engineer (Python, Java)','Đã có kinh nghiệm với các bài toán machine learning trong các hệ thống thương mại điện tử.
Kinh nghiệm làm việc và triển khai ứng dụng Machine Learning trên hệ thống phân tán (distributed system).
Có kinh nghiệm làm việc với Natural Language Processing, đặc biệt là Recurrent Neural Networks (LSTM, biLSTM).','2018-05-06',4);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('[Up to $1200] 05 Java Devs (Spring, MVC)','Có tối thiểu từ 2 năm kinh nghiệm lập trình Java Web, Java Core
Có kinh nghiệm lập trình với các framework: SpingMVC, MyBatis, Hibernate
Có kinh nghiệm lập trình web với MVC framework,Unit Test
Có kinh nghiệm sử dụng Jenkins, Maven, configurate
Địa điểm làm việc: Hà Nội hoặc Đà Nẵng','2018-05-06',5);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Lead DevOps System Engineer (Linux/Java)','Design, support and enhance the automated DevOps release management pipeline which delivers tooling for next generation application development (“Dev”) efforts and on-going production operations (“Ops”).
Foster a continuous delivery and cloud first mindset.
Partner with development and operations teams to develop practical automation solutions and custom modules.
Troubleshoot automation issues and find practical solutions that move projects forward in a timely manner.
Perform complex application programming activities from coding, testing and troubles
Drive delivery direction of the DevOps Teams
Assess, identify, recommend DevOps policy and procedures impacted by change resulting from project assignments or day-to-day business process areas priorities.
Play an integral role in designing and developing continuous delivery, automation and build pipelines that will help the scrum teams delivery fast with minimal technical impediments.
Identify and develop opportunities to improve our processes and tools specifically for Automation.
Manage day-to-day workload and requests using Agile and Lean practices.
Make sure the execution of the builds and deployments to all environments based on build schedule happens','2018-05-06',6);

insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Web Technical Lead (PHP, Java, C#)','Quản lý và tham gia trực tiếp các vấn đề kỹ thuật các dự án thuộc Team Web.
Dự đoán, quản lí và giải quyết các vấn đề rủi ro, phụ thuộc và trở ngại có thể ảnh hưởng đến các dự án của Team.
Quản lí nhân sự, tuyển dụng, đào tạo và điều phối nhân sự của Team.
Quản lí phạm vi, kế hoạch dự án và phân công nhiệm vụ., theo dõi các thành viên trong nhóm.
Phân tích, Quản lí yêu cầu của khách hàng và tham gia tư vấn và trao đổi với khách hàng. 
Chịu trách nhiệm về chất lượng của các dự án thuộc quản lí của Team. 
Làm việc chặt chẽ với PMO để theo dõi tình trạng dự án, rủi ro và kế hoạch hành động. 
Hợp tác với các bộ phận khác liên quan để triển khai dự án và hoàn thành theo kế hoạch. 
Góp phần tích cực cùng PMO cải tiến quy trình và nâng cao chất lượng công việc. ','2018-05-06',7);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('02 Azure Cloud Developers (Java, .NET)','FPT Software Hanoi is looking for 2 Azure Developer with at least 1 years’ experience. The customers are big companies in US, Europe and APAC.
When you join with us, you will have many opportunities for yourself:
Research and train on job with new technologies in Azure and other Cloud Providers.
Design and implement Azure solution projects with other senior/experts
Have chance to work onsite short-time for projects around the world.','2018-05-06',8);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Full Stack Developer Java','Curfex is a dynamic P2P blockchain technology company based in Hong Ko­­­ng providing online peer-to-peer money transfer services. 
We are looking for a full stack developer who will take a key role on our team. Our full stack developer must have knowledge in all stages of software development. 
You will be working alongside other engineers and developers internationally, collaborating on various layers of the infrastructure for our platform.','2018-05-06',9);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Android Developer (UI-UX, Java)','Lập trình trong các dự án gia công phần mềm cho khách hàng Nhật sử dụng ngôn ngữ Java hoặc PHP
Tham gia các công đoạn tìm hiểu yêu cầu, phân tích, thiết kế, nghiên cứu công nghệ khi được phân công.
Tham gia quản lý hay đào tạo nhóm nếu có khả năng phù hợp','2018-05-06',10);


insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Web Technical Lead (PHP, Java, C#)','Quản lý và tham gia trực tiếp các vấn đề kỹ thuật các dự án thuộc Team Web.
Dự đoán, quản lí và giải quyết các vấn đề rủi ro, phụ thuộc và trở ngại có thể ảnh hưởng đến các dự án của Team.
Quản lí nhân sự, tuyển dụng, đào tạo và điều phối nhân sự của Team.
Quản lí phạm vi, kế hoạch dự án và phân công nhiệm vụ., theo dõi các thành viên trong nhóm.
Phân tích, Quản lí yêu cầu của khách hàng và tham gia tư vấn và trao đổi với khách hàng. 
Chịu trách nhiệm về chất lượng của các dự án thuộc quản lí của Team. 
Làm việc chặt chẽ với PMO để theo dõi tình trạng dự án, rủi ro và kế hoạch hành động. 
Hợp tác với các bộ phận khác liên quan để triển khai dự án và hoàn thành theo kế hoạch. 
Góp phần tích cực cùng PMO cải tiến quy trình và nâng cao chất lượng công việc. ','2018-05-06',11);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('02 Azure Cloud Developers (Java, .NET)','FPT Software Hanoi is looking for 2 Azure Developer with at least 1 years’ experience. The customers are big companies in US, Europe and APAC.
When you join with us, you will have many opportunities for yourself:
Research and train on job with new technologies in Azure and other Cloud Providers.
Design and implement Azure solution projects with other senior/experts
Have chance to work onsite short-time for projects around the world.','2018-05-06',12);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Full Stack Developer Java','Curfex is a dynamic P2P blockchain technology company based in Hong Ko­­­ng providing online peer-to-peer money transfer services. 
We are looking for a full stack developer who will take a key role on our team. Our full stack developer must have knowledge in all stages of software development. 
You will be working alongside other engineers and developers internationally, collaborating on various layers of the infrastructure for our platform.','2018-05-06',13);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Android Developer (UI-UX, Java)','Lập trình trong các dự án gia công phần mềm cho khách hàng Nhật sử dụng ngôn ngữ Java hoặc PHP
Tham gia các công đoạn tìm hiểu yêu cầu, phân tích, thiết kế, nghiên cứu công nghệ khi được phân công.
Tham gia quản lý hay đào tạo nhóm nếu có khả năng phù hợp','2018-05-06',14);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Web Technical Lead (PHP, Java, C#)','Quản lý và tham gia trực tiếp các vấn đề kỹ thuật các dự án thuộc Team Web.
Dự đoán, quản lí và giải quyết các vấn đề rủi ro, phụ thuộc và trở ngại có thể ảnh hưởng đến các dự án của Team.
Quản lí nhân sự, tuyển dụng, đào tạo và điều phối nhân sự của Team.
Quản lí phạm vi, kế hoạch dự án và phân công nhiệm vụ., theo dõi các thành viên trong nhóm.
Phân tích, Quản lí yêu cầu của khách hàng và tham gia tư vấn và trao đổi với khách hàng. 
Chịu trách nhiệm về chất lượng của các dự án thuộc quản lí của Team. 
Làm việc chặt chẽ với PMO để theo dõi tình trạng dự án, rủi ro và kế hoạch hành động. 
Hợp tác với các bộ phận khác liên quan để triển khai dự án và hoàn thành theo kế hoạch. 
Góp phần tích cực cùng PMO cải tiến quy trình và nâng cao chất lượng công việc. ','2018-05-06',15);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('02 Azure Cloud Developers (Java, .NET)','FPT Software Hanoi is looking for 2 Azure Developer with at least 1 years’ experience. The customers are big companies in US, Europe and APAC.
When you join with us, you will have many opportunities for yourself:
Research and train on job with new technologies in Azure and other Cloud Providers.
Design and implement Azure solution projects with other senior/experts
Have chance to work onsite short-time for projects around the world.','2018-05-06',16);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Full Stack Developer Java','Curfex is a dynamic P2P blockchain technology company based in Hong Ko­­­ng providing online peer-to-peer money transfer services. 
We are looking for a full stack developer who will take a key role on our team. Our full stack developer must have knowledge in all stages of software development. 
You will be working alongside other engineers and developers internationally, collaborating on various layers of the infrastructure for our platform.','2018-05-06',9);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Android Developer (UI-UX, Java)','Lập trình trong các dự án gia công phần mềm cho khách hàng Nhật sử dụng ngôn ngữ Java hoặc PHP
Tham gia các công đoạn tìm hiểu yêu cầu, phân tích, thiết kế, nghiên cứu công nghệ khi được phân công.
Tham gia quản lý hay đào tạo nhóm nếu có khả năng phù hợp','2018-05-06',17);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Web Technical Lead (PHP, Java, C#)','Quản lý và tham gia trực tiếp các vấn đề kỹ thuật các dự án thuộc Team Web.
Dự đoán, quản lí và giải quyết các vấn đề rủi ro, phụ thuộc và trở ngại có thể ảnh hưởng đến các dự án của Team.
Quản lí nhân sự, tuyển dụng, đào tạo và điều phối nhân sự của Team.
Quản lí phạm vi, kế hoạch dự án và phân công nhiệm vụ., theo dõi các thành viên trong nhóm.
Phân tích, Quản lí yêu cầu của khách hàng và tham gia tư vấn và trao đổi với khách hàng. 
Chịu trách nhiệm về chất lượng của các dự án thuộc quản lí của Team. 
Làm việc chặt chẽ với PMO để theo dõi tình trạng dự án, rủi ro và kế hoạch hành động. 
Hợp tác với các bộ phận khác liên quan để triển khai dự án và hoàn thành theo kế hoạch. 
Góp phần tích cực cùng PMO cải tiến quy trình và nâng cao chất lượng công việc. ','2018-05-06',18);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('02 Azure Cloud Developers (Java, .NET)','FPT Software Hanoi is looking for 2 Azure Developer with at least 1 years’ experience. The customers are big companies in US, Europe and APAC.
When you join with us, you will have many opportunities for yourself:
Research and train on job with new technologies in Azure and other Cloud Providers.
Design and implement Azure solution projects with other senior/experts
Have chance to work onsite short-time for projects around the world.','2018-05-06',19);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Full Stack Developer Java','Curfex is a dynamic P2P blockchain technology company based in Hong Ko­­­ng providing online peer-to-peer money transfer services. 
We are looking for a full stack developer who will take a key role on our team. Our full stack developer must have knowledge in all stages of software development. 
You will be working alongside other engineers and developers internationally, collaborating on various layers of the infrastructure for our platform.','2018-05-06',9);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Android Developer (UI-UX, Java)','Lập trình trong các dự án gia công phần mềm cho khách hàng Nhật sử dụng ngôn ngữ Java hoặc PHP
Tham gia các công đoạn tìm hiểu yêu cầu, phân tích, thiết kế, nghiên cứu công nghệ khi được phân công.
Tham gia quản lý hay đào tạo nhóm nếu có khả năng phù hợp','2018-05-06',20);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Web Technical Lead (PHP, Java, C#)','Quản lý và tham gia trực tiếp các vấn đề kỹ thuật các dự án thuộc Team Web.
Dự đoán, quản lí và giải quyết các vấn đề rủi ro, phụ thuộc và trở ngại có thể ảnh hưởng đến các dự án của Team.
Quản lí nhân sự, tuyển dụng, đào tạo và điều phối nhân sự của Team.
Quản lí phạm vi, kế hoạch dự án và phân công nhiệm vụ., theo dõi các thành viên trong nhóm.
Phân tích, Quản lí yêu cầu của khách hàng và tham gia tư vấn và trao đổi với khách hàng. 
Chịu trách nhiệm về chất lượng của các dự án thuộc quản lí của Team. 
Làm việc chặt chẽ với PMO để theo dõi tình trạng dự án, rủi ro và kế hoạch hành động. 
Hợp tác với các bộ phận khác liên quan để triển khai dự án và hoàn thành theo kế hoạch. 
Góp phần tích cực cùng PMO cải tiến quy trình và nâng cao chất lượng công việc. ','2018-05-06',7);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('02 Azure Cloud Developers (Java, .NET)','FPT Software Hanoi is looking for 2 Azure Developer with at least 1 years’ experience. The customers are big companies in US, Europe and APAC.
When you join with us, you will have many opportunities for yourself:
Research and train on job with new technologies in Azure and other Cloud Providers.
Design and implement Azure solution projects with other senior/experts
Have chance to work onsite short-time for projects around the world.','2018-05-06',8);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Full Stack Developer Java','Curfex is a dynamic P2P blockchain technology company based in Hong Ko­­­ng providing online peer-to-peer money transfer services. 
We are looking for a full stack developer who will take a key role on our team. Our full stack developer must have knowledge in all stages of software development. 
You will be working alongside other engineers and developers internationally, collaborating on various layers of the infrastructure for our platform.','2018-05-06',9);
insert into post(tieuDe, noiDung,datePost,idCompany)  
values('Android Developer (UI-UX, Java)','Lập trình trong các dự án gia công phần mềm cho khách hàng Nhật sử dụng ngôn ngữ Java hoặc PHP
Tham gia các công đoạn tìm hiểu yêu cầu, phân tích, thiết kế, nghiên cứu công nghệ khi được phân công.
Tham gia quản lý hay đào tạo nhóm nếu có khả năng phù hợp','2018-05-06',10);
