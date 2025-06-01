
# Đại học Quốc gia TP.HCM  
## Trường Đại học Khoa học Tự nhiên  
### Khoa Công nghệ Thông Tin  

---

# Bài tập 2: Quản lý quyền truy cập dự án  
**Môn học:** Hệ điều hành Linux và ứng dụng  
**Sinh viên thực hiện:**  
22127300 – Phan Trung Nguyên  
**Giảng viên:**  
Thầy Lê Hà Minh  
Thầy Phan Quốc Kỳ  

**Ngày:** 31 tháng 05 năm 2025  

---

## Mục lục

1. [Create Project Groups and Users](#1-create-project-groups-and-users)  
2. [Assign Users to Groups](#2-assign-users-to-groups)  
3. [Set Up Project Directories](#3-set-up-project-directories)  
4. [Set Up Directory Permissions](#4-set-up-directory-permissions)  
5. [Test Access to the Alpha Directory](#5-test-access-to-the-alpha-directory)  
6. [Test Access to Beta Reports Directory](#6-test-access-to-beta-reports-directory)  
7. [Final Reflection](#7-final-reflection)  
8. [Extension Challenge](#8-extension-challenge)  

---

## 1. Create Project Groups and Users
![](https://drive.google.com/uc?export=view&id=1SUDtfz68ySZAzfng7ipPSd7dnv7KEOJj)
![](https://drive.google.com/uc?export=view&id=1Rv0a4q6QSMPx6IP7pzc20JtbcRqVZpKK)
- `sudo groupadd developers`:  
  + Tạo group mới tên là `developers`.  
- `sudo groupadd testers`:  
  + Tạo group mới tên là `testers`.  
- `sudo useradd -m -s /bin/bash dev_lead`:  
  + Tạo user mới có thư mục home và shell là `/bin/bash`.

> **Tương tự** thực hiện cho các user còn lại như `dev_junior`, `tester_lead`, `tester_junior`, `guest_user`.

### Kiểm tra group và user:
- `tac /etc/group`: Kiểm tra group mới tạo.  
- `tac /etc/passwd`: Kiểm tra user mới tạo.

> **Checkpoint Question:**  
> Group mặc định của user mới là nhóm trùng tên với username.

---

## 2. Assign Users to Groups

- `sudo usermod -aG developers dev_lead`: Thêm user `dev_lead` vào group `developers`  
- `groups dev_lead`: Kiểm tra các group của user.  

> **Checkpoint Question:**  
> `dev_lead` hiện đang là thành viên của các nhóm: `dev_lead`, `developers`, `testers`.

---

## 3. Set Up Project Directories

- `sudo mkdir -p /projects/alpha`  
- `sudo mkdir -p /projects/beta_reports`  
- `sudo chown :developers /projects/alpha`  
- `sudo chown :testers /projects/beta_reports`  
- `ls -ld /projects/alpha`  

> **Checkpoint Question:**  
> Thư mục do root tạo sẽ có owner và group mặc định là `root`.

---

## 4. Set Up Directory Permissions

- `sudo chmod 770 /projects/alpha`  
  + Owner: `rwx`  
  + Group: `rwx`  
  + Others: `---`

- `sudo chmod 750 /projects/beta_reports`  
  + Owner: `rwx`  
  + Group: `r-x`  
  + Others: `---`

> **Checkpoint Question:**  
> - `/projects/alpha`: quyền `770`  
> - `/projects/beta_reports`: quyền `750`

---

## 5. Test Access to the Alpha Directory

- `sudo su - dev_junior`  
- `cd /projects/alpha` ✅  
- `touch dev_file.txt` ✅  

- `sudo su - guest_user`  
- `cd /projects/alpha` ❌ (Permission denied)

> **Checkpoint Question:**  
> - `dev_junior` có quyền vì thuộc `developers`.  
> - `guest_user` không có quyền vì không thuộc group, và others không được cấp quyền.

---

## 6. Test Access to Beta Reports Directory

- `sudo su - tester_junior`  
- `cd /projects/beta_reports` ✅  
- `touch testfile.txt` ❌  

- `sudo bash -c 'echo "Test report" > /projects/beta_reports/sample_report.txt'`  
- `sudo su - dev_lead`  
- `cat /projects/beta_reports/sample_report.txt` ✅  
- `rm sample_report.txt` ❌  

> **Checkpoint Question:**  
> - `tester_junior` không ghi được vì group không có quyền `w`.  
> - `dev_lead` có thể đọc nhưng không xóa được.

---

## 7. Final Reflection

1. Quyền execute (`x`) cho thư mục cho phép truy cập vào thư mục, nhưng không xem được nội dung nếu không có quyền read (`r`).  
2. Phân quyền cho group cần phải đúng group sở hữu thì quyền mới có hiệu lực.  
3. Dùng `usermod -aG` để thêm user vào nhiều group mà không mất group cũ.

---

## 8. Extension Challenge

- Thiết lập **Sticky Bit**:  
  + Gán quyền `+t` để chỉ cho phép **người tạo** được xóa file mình tạo ra trong thư mục chia sẻ.

---
