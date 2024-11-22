<?php
require_once('layouts/header.php');
session_start();
if (isset($_SESSION['id'])) {
    $name = $_SESSION['name'];
    $email = $_SESSION['email'];
    $phone = $_SESSION['phone'];
    $address = $_SESSION['address'];
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Cập nhật thông tin người dùng trong session (hoặc cập nhật vào cơ sở dữ liệu)
    $_SESSION['name'] = $_POST['name'];
    $_SESSION['email'] = $_POST['email'];
    $_SESSION['phone'] = $_POST['phone'];
    $_SESSION['address'] = $_POST['address'];

    // Bạn có thể thực hiện cập nhật vào cơ sở dữ liệu ở đây nếu cần

    echo json_encode(["status" => "success"]);
    exit();
}
?>

<div class="container" style="margin: 50px auto; max-width: 400px;">
    <form id="updateForm" method="post">
        <div class="card">
            <div class="card-body">
                <h2 class="card-title text-center mb-4">Thông tin tài khoản</h2>

                <div class="mb-3">
                    <label for="name" class="form-label">Họ và tên</label>
                    <input required="true" type="text" class="form-control" id="name" name="name" value="<?= $name ?>">
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input required="true" type="email" class="form-control" id="email" name="email" value="<?= $email ?>">
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label">Số điện thoại</label>
                    <input required="true" type="tel" class="form-control" id="phone" name="phone" value="<?= $phone ?>">
                </div>

                <div class="mb-3">
                    <label for="address" class="form-label">Địa chỉ</label>
                    <input required="true" type="text" class="form-control" id="address" name="address" value="<?= $address ?>">
                </div>

                <div class="d-grid gap-2">
                    <button type="button" class="btn btn-primary" id="updateBtn">Cập nhật thông tin</button>
                    <a href="logout.php" class="btn btn-danger">Đăng xuất</a>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
document.getElementById('updateBtn').addEventListener('click', function() {
    var form = document.getElementById('updateForm');
    var formData = new FormData(form);

    // Gửi AJAX request đến server
    fetch('inforuser.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.status === 'success') {
            alert('Cập nhật thông tin thành công!');
        } else {
            alert('Đã xảy ra lỗi. Vui lòng thử lại.');
        }
    })
    .catch(error => {
        console.error('Lỗi:', error);
        alert('Đã xảy ra lỗi. Vui lòng thử lại.');
    });
});
</script>

<?php
require_once('layouts/footer.php');
?>
