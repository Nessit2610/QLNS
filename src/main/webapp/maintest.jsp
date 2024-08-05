<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
        // Hàm này được sử dụng để kiểm tra định dạng của ngày tháng
        function validateDate() {
            var selectedDate = document.getElementById("selectedDate").value;
            // Kiểm tra xem selectedDate có đúng định dạng ngày tháng YYYY-MM-DD không
            var regex = /^\d{4}-\d{2}-\d{2}$/;
            if (!regex.test(selectedDate)) {
                alert("Vui lòng chọn ngày tháng hợp lệ (YYYY-MM-DD)!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <h2>Chọn ngày tháng trong JSP</h2>
    <form action="process.jsp" method="post" onsubmit="return validateDate()">
        <label for="selectedDate">Chọn ngày:</label>
        <input type="date" id="selectedDate" name="selectedDate" required>
        <input type="date" id="selectedDate2" name="selectedDate2" required>
        <input type="submit" value="Submit">
    </form>
</body>
</html>