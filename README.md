# System Investigation

![Hiển thị đường dẫn thư mục hiện tại đang đứng trong
terminal](https://drive.google.com/uc?export=view&id=1LofxNbe95GmEJGT89BTlmQrq_41XevjC)

-   `pwd`: In ra đường dẫn thư mục hiện tại đang đứng trong terminal.

-   `cd Documents`: Sử dụng đường dẫn tương đối đến thư mục
    **Documents** trong thư mục **home**.

# Directory Setup

![Một số dòng lệnh làm việc với thư mục](https://drive.google.com/uc?export=view&id=1uljujVaCJn0-Z1ZWvdG2oMm7OU8bg4it)

-   `mkdir project_logs`: Tạo mới thư mục **project_logs**.

-   `cd project_logs`: Sử dụng đường dẫn tương đối đến thư mục
    **project_logs** trong thư mục **Documents**.

-   `mkdir old_backup archive current`: Tạo mới 3 thư mục
    **old_backup**, **archive** và **current**.

-   `touch temp.txt`: Tạo file rỗng **temp.txt**.

-   `ls -R`: liệt kê toàn bộ nội dung trong thư mục hiện tại và tất cả
    các thư mục con bên trong nó (-R là viết tắt của recursive, tức là
    đệ quy).

# Log Review

![In ra 10 dòng cuối của file log](https://drive.google.com/uc?export=view&id=1QkwsfwS9JyVQmObPsTmErkO9FAYrpb9S)

-   `tail -10 /var/log/syslog`: In ra 10 dòng cuối của file
    **/var/log/syslog**, trong đó -10 biểu thị số dòng muốn in,
    /var/log/syslog là file mong muốn.

![In ra 5 dòng đầu của file log](https://drive.google.com/uc?export=view&id=1bB71alVJrqZpKQ_NuDXoypz7TZJFWYSn)

-   `head -5 /var/log/syslog`: In ra 5 dòng đầu của file
    **/var/log/syslog**, trong đó -5 biểu thị số dòng muốn in,
    /var/log/syslog là file mong muốn.

![Đảo ngược nội dung file log](https://drive.google.com/uc?export=view&id=11O64vVQwRtfEWNeAvcwkzlYCNHG5EOXt)

-   `tac /var/log/syslog`: Hiển thị nội dung file **/var/log/syslog** từ
    cuối lên đầu.

# Pattern Search

![Một số câu lệnh tìm kiếm theo mẫu](https://drive.google.com/uc?export=view&id=1pmHbn7b1uvFH3SP2xZ-oCvY1ssWG6lSe)

![Một số câu lệnh tìm kiếm theo mẫu](https://drive.google.com/uc?export=view&id=1p5Tj9h9sYIYhWVNZF8oWT-aR0flt5oTM)

![Kiểm tra kết quả file errors.log](https://drive.google.com/uc?export=view&id=1Uhrit2EYiWGtrMM9-_kqwQpxbLzppkpj)

-   `grep -i 'error' /var/log/syslog `: Tìm tất cả dòng chứa từ
    **error** trong file **/var/log/syslog**, trong đó -i cho phép không
    phân biệt chữ hoa và chữ thường (case-insensitive).

-   `grep -i 'error' /var/log/syslog > errors.log `: \> dùng để ghi kết
    quả vào file **errors.log**

-   `grep -ic 'error' /var/log/syslog `: Đếm số dòng chứa từ khóa
    **error**.

# Stream Redirection

![Một số câu lệnh điều hướng trong
Linux](https://drive.google.com/uc?export=view&id=1Bk8cRDXKh01F1Ben38Tb1ZE0AGzRnoYq)

![Xem kết quả](https://drive.google.com/uc?export=view&id=1njkN0RdveFnAEIr_HwPOT98_V5SS1h5t)

-   `ls /etc > etc_list.txt`: Liệt kê toàn bộ nội dung thư mục **etc**
    và ghi đè vào etc_list.txt (overwrite).

-   `ls /bin >> etc_list.txt`: Liệt kê toàn bộ nội dung thư mục **bin**
    và ghi tiếp vào cuối file etc_list.txt (append).

-   `less etc_list.txt`: Xem kết quả theo trang.

# Text Processing

![Một số câu lệnh xử lý văn bản](https://drive.google.com/uc?export=view&id=149dE7IxDX7YbzVYLTN8l0juvLk1Bq61w)

![Một số câu lệnh xử lý văn bản](https://drive.google.com/uc?export=view&id=1xyzlRxsz3T55n0HCi9AGswtJw_7ZdzTi)

-   `echo -e "Alice:Admin\nBob:User\nCarol:Guest" > users.txt`: Lệnh
    echo dùng để in ra text đề bài yêu cầu ra màn hình, dùng \>
    users.txt để chuyển hướng output vào file **users.txt**, trong đó -e
    cho phép echo hiểu và xử lý các ký tự escape đặc biệt trong chuỗi

-   `cut -d ':' -f 1 users.txt | tr '[:upper:]' '[:lower:]' | sort -r`

    -   `cut -d ':' -f 1 users.txt`: Dùng cut để cắt lấy các field của
        các dòng trong file **users.txt**, trong đó -d ':' là kí tự phân
        cách, -f 1 nghĩa là lấy field thứ nhất.

    -   `tr '[:upper:]' '[:lower:]'`: Dùng tr để chuyển tất cả chữ hoa
        thành chữ thường trên input nhận được.

    -   `sort -r`: Dùng sort để sắp xếp các dòng văn bản, trong đó -r
        nghĩa là sắp xếp theo thứ tự giảm dần (reverse order).

# Cleanup Script

![Xóa, di chuyển, sao chép các file và thư
mục](https://drive.google.com/uc?export=view&id=1e5U81TkH2o1jrydovOc55DY9qaK5SqjG)

-   `rm -r old_backup`: Xóa thư mục **old_backup**, trong đó -r cho phép
    xóa các file và thư mục con bên trong nó.

-   `rm temp.txt`: Xóa file **temp.txt**.

-   `mv report.txt archive/`: Di chuyển file **report.txt** vào thư mục
    **archive**.

-   `cp archive/report.txt current/report_backup.txt`: Sử dụng đường dẫn
    tương đối để sao chép file **report.txt** trong thư mục **archive**
    vào file **report_backup.txt** trong thư mục **current**.

# File Hunting

![Một số câu lệnh tìm kiếm file](https://drive.google.com/uc?export=view&id=13JkOG0chnkK5VRRBLOQvRDkTerxs3NHa)

![Một số câu lệnh tìm kiếm file](https://drive.google.com/uc?export=view&id=/11jvqEUUt2lkqXKf6lgomQCSyBhysae7h)

-   `find /etc -type f -name "*.conf"`: Sử dụng kí tự wildcard \* để tìm
    tất cả file .conf trong /etc, trong đó -type f nghĩa là chỉ tìm
    file, \* là ký tự đại diện (wildcard) có nghĩa là bất kỳ chuỗi ký tự
    nào (bao gồm cả chuỗi rỗng) vì vậy -name \"\*.conf\" sẽ khớp với tất
    cả các tên file có phần đuôi là .conf.

-   `find ~ -perm 755 -a -type f`: Tìm các file có quyền truy cập là 755
    trong thư mục home, trong đó -perm 755 dùng để lọc theo quyền truy
    cập.

-   ``: Tìm tất cả thư mục trong /usr mà tên chứa chuỗi lib, trong đó
    -type d nghĩa là chỉ tìm thư mục (directory), -name \"\*lib\" sẽ
    khớp với tất cả các tên directory có chứa chuỗi lib.

# Joining Data

![Kết hợp dữ liệu từ hai file](https://drive.google.com/uc?export=view&id=1Xe21610ivQKZaz71bxEC2pQZliCRF5Ta)

-   `echo -e "1 Alice\n2 Bob\n3 Carol" > names.txt` và
    `echo -e "1 Admin\n2 User\n3 Guest" > roles.txt`: Tạo 2 file
    **names.txt** và **roles.txt** với nội dung theo yêu cầu đề bài.

-   `join names.txt roles.txt`: Lệnh join dùng để nối (join) 2 file theo
    trường khóa chung, mặc định join sẽ lấy cột đầu tiên của mỗi file
    làm khóa.

# Line Numbering & Word Counts

![Đánh số dòng và đếm số dòng, số từ, số byte của
file](https://drive.google.com/uc?export=view&id=1TDpYlN-u1dwaAg9ziRwowCTJueplVD-y)

-   `nl users.txt`: Đánh số dòng cho mỗi dòng trong file **users.txt**.

-   `wc users.txt`: Đếm số lượng dòng, từ, và kí tự (bytes) trong file
    **users.txt**. Ví dụ như file **users.txt** có 3 dòng, 3 từ và 33
    byte.
