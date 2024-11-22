<?php
$title = "Trang Quản lý đơn hàng";
$baseUrl = '../';
include_once '../layouts/header.php';
$db = new Database();

// Lấy danh sách đơn hàng và phân loại theo trạng thái
$sql = "SELECT id, fullname, email, phone_number, address, order_date, status, total_money 
        FROM orders 
        ORDER BY status ASC, order_date DESC";
$data = $db->executeResult($sql);

// Phân loại đơn hàng theo trạng thái
$orders = [
    'pending' => [],
    'approved' => [],
    'canceled' => []
];
foreach ($data as $item) {
    switch ($item['status']) {
        case 0:
            $orders['pending'][] = $item;
            break;
        case 1:
            $orders['approved'][] = $item;
            break;
        case 2:
            $orders['canceled'][] = $item;
            break;
    }
}
?>
<!-- Content Wrapper -->
<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
            <h1 class="m-0 mb-3">Danh sách đơn hàng</h1>

            <!-- Hiển thị từng nhóm đơn hàng -->
            <h2 class="mt-4">Đơn hàng đang chờ xử lý</h2>
            <?php renderOrderTable($orders['pending']); ?>

            <h2 class="mt-4">Đơn hàng đã duyệt</h2>
            <?php renderOrderTable($orders['approved']); ?>

            <h2 class="mt-4">Đơn hàng đã hủy</h2>
            <?php renderOrderTable($orders['canceled']); ?>
        </div>
    </div>
</div>

<!-- Script xử lý AJAX -->
<script>
    function changeStatus(id, status) {
        if (!confirm('Bạn có muốn cập nhật trạng thái đơn hàng này không?')) return;

        $.post('form_api.php', {
            'id': id,
            'status': status,
            'action': 'update_status'
        }, function(data) {
            alert('Cập nhật trạng thái thành công!');
            location.reload();
        }).fail(function() {
            alert('Có lỗi xảy ra. Vui lòng thử lại.');
        });
    }

    function deleteUser(id) {
        if (!confirm('Bạn có chắc chắn muốn xoá đơn hàng này không?')) return;

        $.post('form_api.php', {
            'id': id,
            'action': 'delete'
        }, function(data) {
            alert('Xóa đơn hàng thành công!');
            location.reload();
        }).fail(function() {
            alert('Có lỗi xảy ra. Vui lòng thử lại.');
        });
    }
</script>
<?php
include_once '../layouts/footer.php';

// Hàm render bảng đơn hàng
function renderOrderTable($orders) {
    if (count($orders) == 0) {
        echo "<p>Không có đơn hàng trong danh mục này.</p>";
        return;
    }

    echo '<table class="table table-hover mt-5 table-bordered">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Họ và tên</th>
                    <th>SĐT</th>
                    <th>Địa chỉ</th>
                    <th>Ngày tạo</th>
                    <th>Tổng tiền</th>
                    <th>Hành động</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>';

    $index = 0;
    foreach ($orders as $item) {
        echo '<tr>
                <th>' . (++$index) . '</th>
                <td>' . htmlspecialchars($item['fullname']) . '</td>
                <td>' . htmlspecialchars($item['phone_number']) . '</td>
                <td>' . htmlspecialchars($item['address']) . '</td>
                <td>' . $item['order_date'] . '</td>
                <td>' . number_format($item['total_money']) . ' VNĐ</td>
                <td>
                    <a href="./detail.php?id=' . $item['id'] . '" class="btn btn-info fa fa-eye"></a>
                    <button onclick="deleteUser(' . $item['id'] . ')" class="btn btn-danger fa fa-trash-alt"></button>
                </td>
                <td>';
        
        if ($item['status'] == 0) {
            echo '<button onclick="changeStatus(' . $item['id'] . ',1)" class="btn btn-success">Đồng ý</button>
                  <button onclick="changeStatus(' . $item['id'] . ',2)" class="btn btn-danger">Huỷ</button>';
        } elseif ($item['status'] == 1) {
            echo '<span class="badge badge-success">Success</span>';
        } else {
            echo '<span class="badge badge-danger">Cancel</span>';
        }
        
        echo    '</td>
            </tr>';
    }

    echo '</tbody></table>';
}
?>
