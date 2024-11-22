<?php
session_start();
include_once('../utils/utility.php');
include_once('../db/database.php');

	$action = Utility::getPost('action');
switch ($action) {
	case 'cart':
		addToCart();
		break;

	case 'update_cart':
		updateCart();
		break;

	case 'checkout':
		checkout();
		break;
	case 'delete_cart':
		deleteCart();
		break;
}

function checkout()
{
    if (!isset($_SESSION['cart']) || count($_SESSION['cart']) == 0) {
        return;
    }

    $db = new Database();

    $fullname = Utility::getPost("fullname");
	$email = Utility::getPost("email");
	$phone_number = Utility::getPost("phone_number");
	$address = Utility::getPost("address");
	$note = Utility::getPost("note");


    $user = Utility::getUserToken();
    $userId = $user['id'] ?? 0;

    $orderDate = date('Y-m-d H:i:s');
    $totalMoney = 0;

    foreach ($_SESSION['cart'] as $item) {
        $totalMoney += $item['discount'] * $item['num'];
    }

    // Thêm đơn hàng
    $sql = "INSERT INTO orders (user_id, fullname, email, phone_number, address, note, order_date, status, total_money) 
            VALUES ($userId, '$fullname', '$email', '$phone_number', '$address', '$note', '$orderDate', 0, $totalMoney)";
    $db->execute($sql);
	//kiem tra loi
	$result = $db->execute($sql);
	if (!$result) {
		die('Lỗi khi thêm đơn hàng!');
	}
	
    // Lấy id của đơn hàng vừa thêm
    $sql = "SELECT id FROM orders WHERE order_date = '$orderDate' AND user_id = $userId";
    $orderItem = $db->executeResult($sql, true);

    if (!$orderItem) {
        die("Lỗi: Không thể truy xuất thông tin đơn hàng.");
    }

    $orderId = $orderItem['id'];

    // Thêm chi tiết đơn hàng
    foreach ($_SESSION['cart'] as $item) {
        $product_id = $item['id'];
        $price = $item['discount'];
        $num = $item['num'];
        $totalMoney = $price * $num;

        $sql = "INSERT INTO order_details (order_id, product_id, price, num, total_money) 
                VALUES ($orderId, $product_id, $price, $num, $totalMoney)";
        $db->execute($sql);
    }

    // Làm trống giỏ hàng
    unset($_SESSION['cart']);
}

function deleteCart(){
	updateCart(); 
}

function updateCart()
{
	$id = Utility::getPost('id');
	$num = Utility::getPost('num');

	if (!isset($_SESSION['cart'])) {
		$_SESSION['cart'] = [];
	}

	for ($i = 0; $i < count($_SESSION['cart']); $i++) {
		if ($_SESSION['cart'][$i]['id'] == $id) {
			$_SESSION['cart'][$i]['num'] = $num;
			if ($num <= 0) {
				array_splice($_SESSION['cart'], $i, 1);
			}
			break;
		}
	}
}


function addToCart()
{
	$db = new Database();
	$id = Utility::getPost('id');
	$num = Utility::getPost('num');
	if (!isset($_SESSION['cart'])) {
		$_SESSION['cart'] = [];
	}
	$isFind = false;

	for ($i = 0; $i < count($_SESSION['cart']); $i++) {
		if ($_SESSION['cart'][$i]['id'] == $id) {
			$_SESSION['cart'][$i]['num'] += $num;
			$isFind = true;
			break;
		}
	}
	if (!$isFind) {
		$sql = "SELECT Products.*, Categories.name as category_name from Products left join Categories on Products.category_id = Categories.id where Products.id = $id";
		$product = $db->executeResult($sql, true);
		$product['num'] = $num;
		$_SESSION['cart'][] = $product;
	}
}
