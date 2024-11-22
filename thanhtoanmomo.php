<?php
session_start();
header('Content-type: text/html; charset=utf-8');

function execPostRequest($url, $data)
{
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
            'Content-Length: ' . strlen($data))
    );
    curl_setopt($ch, CURLOPT_TIMEOUT, 5);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
    // execute post
    $result = curl_exec($ch);
    // close connection
    curl_close($ch);
    return $result;
}

// Kiểm tra nếu không có giá trị trong $_SESSION['gia']
if (!isset($_SESSION['gia']) || $_SESSION['gia'] <= 0) {
    echo "Error: Invalid or missing payment amount.";
    exit();
}

$endpoint = "https://test-payment.momo.vn/v2/gateway/api/create";

// Thông tin tài khoản MoMo
$partnerCode = 'MOMOBKUN20180529'; 
$accessKey = 'klm05TvNBzhg7h7j'; 
$secretKey = 'at67qH6mk8w5Y1nAyMoYKMWACiEi2bsa'; 
$orderInfo = "Thanh toán qua QR MoMo";
$amount = $_SESSION['gia']; // Tổng tiền thanh toán từ giỏ hàng
$orderId = time() .""; // ID đơn hàng duy nhất
$redirectUrl = "http://localhost/checkout.php"; // URL sau khi thanh toán thành công
$ipnUrl = "http://localhost/checkout.php"; // URL xử lý thông báo kết quả thanh toán
$extraData = ""; // Thông tin bổ sung nếu cần

$requestId = time() . ""; 
$requestType = "captureWallet";

// Chuẩn bị chuỗi dữ liệu để tính toán chữ ký
$rawHash = "accessKey=" . $accessKey . "&amount=" . $amount . "&extraData=" . $extraData . "&ipnUrl=" . 
           $ipnUrl . "&orderId=" . $orderId . "&orderInfo=" . $orderInfo . "&partnerCode=" . $partnerCode . 
           "&redirectUrl=" . $redirectUrl . "&requestId=" . $requestId . "&requestType=" . $requestType;

$signature = hash_hmac("sha256", $rawHash, $secretKey);

// Dữ liệu gửi đến Momo
$data = array(
    'partnerCode' => $partnerCode,
    'partnerName' => "Test",
    "storeId" => "MomoTestStore",
    'requestId' => $requestId,
    'amount' => $amount,
    'orderId' => $orderId,
    'orderInfo' => $orderInfo,
    'redirectUrl' => $redirectUrl,
    'ipnUrl' => $ipnUrl,
    'lang' => 'vi',
    'extraData' => $extraData,
    'requestType' => $requestType,
    'signature' => $signature
);

// Gửi yêu cầu thanh toán đến MoMo
$result = execPostRequest($endpoint, json_encode($data));
$jsonResult = json_decode($result, true); // Giải mã kết quả trả về từ MoMo

// Lưu lại phản hồi để kiểm tra lỗi
file_put_contents("momo_response_log.txt", $result);

if (isset($jsonResult['payUrl'])) {
    // Chuyển hướng người dùng đến URL thanh toán của MoMo
    header('Location: ' . $jsonResult['payUrl']);
    exit();
} else {
    // Xử lý khi không nhận được payUrl
    if (isset($jsonResult['message'])) {
        echo "Error: " . $jsonResult['message'];
    } else {
        echo "Error: Unexpected response from MoMo API.";
    }
}
?>
