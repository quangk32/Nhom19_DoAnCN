<?php
require_once('layouts/header.php');
require_once('db/database.php');

// Lấy email của user hiện tại (giả sử đã lưu trong session)
$user_email = $_SESSION['email'];

// Kết nối database
$db = new Database();

// Lấy danh sách đơn hàng của user
$order_sql = "SELECT id, order_date, total_money, status FROM orders WHERE email = '$user_email' ORDER BY order_date DESC";
$order_list = $db->executeResult($order_sql);
?>
<div class="container" style="margin-top: 20px;">
    <h2>Lịch sử đơn hàng</h2>
    <table class="table table-bordered table-hover" style="margin-top: 20px;">
        <thead>
            <tr>
                <th>Mã đơn hàng</th>
                <th>Ngày đặt hàng</th>
                <th>Tổng tiền</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <?php if (empty($order_list)) : ?>
                <tr>
                    <td colspan="5" style="text-align: center;">Bạn chưa có đơn hàng nào.</td>
                </tr>
            <?php else : ?>
                <?php foreach ($order_list as $order) : ?>
                    <tr>
                        <td>#<?php echo $order['id']; ?></td>
                        <td><?php echo date('d/m/Y H:i', strtotime($order['order_date'])); ?></td>
                        <td><?php echo number_format($order['total_money']); ?> VND</td>
                        <td>
                            <?php
                            switch ($order['status']) {
                                case 0: echo "<span class='text-warning font-weight-bold'>Đang xử lý</span>"; break;
                                case 1: echo "<span class='text-primary font-weight-bold'>Đang giao</span>"; break;
                                case 2: echo "<span class='text-danger font-weight-bold'>Đã hủy</span>"; break;
                                //case 3: echo "<span class='text-success font-weight-bold'>Đã giao</span>"; break;
                                default: echo "<span class='text-muted font-weight-bold'>Không xác định</span>";
                            }
                            ?>
                        </td>
                        <td>
                            <a href="orderDetail.php?id=<?php echo $order['id']; ?>" class="btn btn-info btn-sm">Xem chi tiết</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            <?php endif; ?>
        </tbody>
    </table>
</div>
<?php
require_once('layouts/footer.php');
?>
