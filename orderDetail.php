<?php
require_once('layouts/header.php');
require_once('db/database.php');

// Lấy ID đơn hàng từ URL
$order_id = isset($_GET['id']) ? intval($_GET['id']) : 0;

// Kiểm tra user có quyền truy cập đơn hàng này
$user_email = $_SESSION['email'];

// Kết nối database
$db = new Database();
$order_sql = "SELECT * FROM orders WHERE id = $order_id AND email = '$user_email'";
$order = $db->executeSingleResult($order_sql);

if (!$order) {
    echo "<div class='container' style='margin-top: 20px;'><h3>Đơn hàng không tồn tại hoặc bạn không có quyền truy cập.</h3></div>";
    require_once('layouts/footer.php');
    exit;
}

// Lấy chi tiết đơn hàng từ bảng order_details
$order_detail_sql = "SELECT od.*, p.name, p.image 
                     FROM order_details od 
                     JOIN products p ON od.product_id = p.id 
                     WHERE od.order_id = $order_id";
$order_details = $db->executeResult($order_detail_sql);
?>

<div class="container" style="margin-top: 20px;">
    <a href="orderHistory.php"><button class="btn btn-primary">Quay lại</button></a>
    <div class="col-md-12">
        <h2 class="m-0 mb-3" style="padding-top: 16px; text-align: center;"><b>Chi tiết đơn hàng #<?php echo $order['id']; ?></b></h2>
    </div>
    <p>Ngày đặt hàng: <?php echo date('d/m/Y H:i', strtotime($order['order_date'])); ?></p>
    <p>Trạng thái: 
        <?php
        switch ($order['status']) {
            case 0: echo "<span class='text-warning font-weight-bold'>Đang xử lý</span>"; break;
            case 1: echo "<span class='text-primary font-weight-bold'>Đang giao</span>"; break;
            case 2: echo "<span class='text-danger font-weight-bold'>Đã hủy</span>"; break;
            default: echo "<span class='text-muted font-weight-bold'>Không xác định</span>";
        }
        ?>
    </p>
    <h3 style="text-align:center">Chi tiết sản phẩm</h3>
    <table class="table table-bordered table-striped table-hover">
        <thead class="table-primary">
            <tr  class="text-center">
                <th>Hình ảnh</th>
                <th>Tên sản phẩm</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
                <th>Thành tiền</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($order_details as $item) : ?>
                <tr>
                    <td>
                        <img src="<?php echo $item['image']; ?>" alt="<?php echo htmlspecialchars($item['name']); ?>" style="max-width: 50px; max-height: 50px;">
                    </td>
                    <td><?php echo htmlspecialchars($item['name']); ?></td>
                    <td><?php echo $item['num']; ?></td>
                    <td><?php echo number_format($item['price']); ?> VND</td>
                    <td><?php echo number_format($item['price'] * $item['num']); ?> VND</td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <p style="text-align:end"><strong>Tổng tiền: </strong><?php echo number_format($order['total_money']); ?> VND</p>
</div>

<?php
require_once('layouts/footer.php');
?>
